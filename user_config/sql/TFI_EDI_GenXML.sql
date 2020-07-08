SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TFI_EDI_GenXML]
--DEBUG
/*
EXEC [TFI_EDI_GenXML];
SELECT TOP 1000 *
FROM dbo.[TFI_EDI_GenXML_Log]
ORDER BY [ID] DESC;
*/
--EXEC [TFI_EDI_GenXML] 19145;

AS
BEGIN
--work variables
DECLARE @query NVARCHAR(4000);
DECLARE @filePath VARCHAR(254);
DECLARE @filePathArchive VARCHAR(254);
DECLARE @fileName VARCHAR(254);
DECLARE	@fullPath VARCHAR(254);
DECLARE	@fullPathArchive VARCHAR(254);
DECLARE	@fileAttachment VARCHAR(254);
DECLARE @emailSubject VARCHAR(50);
DECLARE @i0 INT;
DECLARE @i1 INT;
DECLARE @i2 INT;
DECLARE @Now nVarChar(max);
DECLARE @GUID UNIQUEIDENTIFIER;
DECLARE	@sGUID VARCHAR(254);


	--create the tracking table
	IF NOT EXISTS(
				SELECT	*
				FROM	[master].[sys].[system_objects]
				WHERE 	id = object_id(N'dbo.[TFI_EDI_GenXML_Log]')
						AND
						OBJECTPROPERTY(id, N'IsUserTable') = 1)
			BEGIN
				CREATE TABLE [dbo].[TFI_EDI_GenXML_Log](
					[ID] [int] IDENTITY(1,1) NOT NULL,
					[DateTime] [datetime] NULL,
					[Message] [nvarchar](1000) NULL
				) ON [PRIMARY];
				ALTER TABLE [dbo].[TFI_EDI_GenXML_Log] ADD  CONSTRAINT [DF_TFI_EDI_GenXML_Log_DateTime]  DEFAULT (getdate()) FOR [DateTime];

			END;

	--temp dir for attachment gen
	SET @filePath = 'D:\B1_SHR\EDI\810_XML\Temp\';
	SET @filePathArchive = 'D:\B1_SHR\EDI\810_XML\Out\';
	--print 'A';


	--holder of invoices to process
	CREATE TABLE #InvoiceList
		(
		 [ID] INT IDENTITY(1,1)
		,[DocEntry] INT
		);

	--list Invoices to process
	INSERT INTO #InvoiceList
		([DocEntry])
	SELECT
		i.[DocEntry]
		FROM [OINV] i
		WHERE i.[DocStatus] = 'O' AND i.[U_EDIGen] = 'Y'
		ORDER BY i.[DocEntry];
	SET @i0 = @@ROWCOUNT;
	SET @i1 = 1;

	INSERT INTO dbo.[TFI_EDI_GenXML_Log] (Message)
	VALUES ('Invoice List ' + (CAST (@i0 AS NVARCHAR)));

	INSERT INTO dbo.[TFI_EDI_GenXML_Log] (Message)
	SELECT [DocEntry] FROM #InvoiceList ORDER BY [ID]

	--SELECT @i0, @i1;

	WHILE @i1 <= @i0
	BEGIN
	--set query to create the report
	SET @query = 'EXEC [LH_Build].[dbo].[MBC_EDI_INTo810XML] ' + CAST((SELECT [DocEntry] FROM #InvoiceList WHERE [ID] = @i1) AS NVARCHAR);
	--select @query;
	-- generate the dynamic file name based on the date and time
	SET @Now =  replace(convert(varchar(8), GETDATE(), 112)+convert(varchar(8), GETDATE(), 114), ':','');
	SET @Now = substring(@Now ,3,15);
	SET @GUID = NEWID()
	--SELECT @NOW
	SET @sGUID = CONVERT(NVARCHAR(255), @GUID);
	--create the file name
	--SELECT @GUID
	SET @fileName = 'IN_' + @sGUID + '.xml';
	--SELECT @filename
	--create full path
	SET @fullPath = @filePath + @fileName;
	SET @fullPathArchive = @filePathArchive + @fileName;

	--log
	INSERT INTO dbo.[TFI_EDI_GenXML_Log] (Message)
	VALUES ('---Start---');

	INSERT INTO dbo.[TFI_EDI_GenXML_Log] (Message)
	VALUES ('Save file ' + @fullPath);

	-- test the query to get the output records count
	DECLARE @x0 NVARCHAR(MAX) = NULL;
	EXEC @x0 = sp_executesql @query;
	IF (@x0) IS NOT NULL
	BEGIN
		-- save to file
		DECLARE @cmd varchar(1000);
		SET @cmd = 'bcp "' + @query + '" queryout "' + @fullPath + '" -T -w';

		--print @cmd;
		INSERT INTO dbo.[TFI_EDI_GenXML_Log] (Message)
		EXEC xp_cmdshell @cmd;

		--Archive file
		INSERT INTO dbo.[TFI_EDI_GenXML_Log] (Message)
		VALUES ('Start file archive');

		DECLARE @cmdArchive varchar(1000)
		SET @cmdArchive = 'MOVE '+ @fullPath + ' ' + @fullPathArchive;

		INSERT INTO dbo.[TFI_EDI_GenXML_Log] (Message)
		VALUES ('Archiving file ' + @fullPath + ' to ' + @fullPathArchive);

		--print @cmdArchive
		INSERT INTO dbo.[TFI_EDI_GenXML_Log] (Message)
		EXEC xp_cmdshell @cmdArchive;

		INSERT INTO dbo.[TFI_EDI_GenXML_Log] (Message)
		VALUES ('End file archive');

		INSERT INTO dbo.[TFI_EDI_GenXML_Log] (Message)
		VALUES ('Updating Flaq');

		UPDATE [OINV]
		SET [U_EDIGen] = 'N'
		WHERE [DocEntry] = (SELECT [DocEntry] FROM #InvoiceList WHERE [ID] = @i1);

	END
	ELSE
	BEGIN
		INSERT INTO dbo.[TFI_EDI_GenXML_Log] (Message)
		VALUES ('Skip report: query output is empty');
	END

	SET @i1 = @i1 + 1;
	END
	--log job complete
	INSERT INTO dbo.[TFI_EDI_GenXML_Log] (Message)
	VALUES ('---Finished---');

	DROP TABLE #InvoiceList;
END
GO
