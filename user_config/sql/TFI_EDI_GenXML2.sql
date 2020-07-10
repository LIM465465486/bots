SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[TFI_EDI_GenXML2]
--DEBUG
/*
EXEC [TFI_EDI_GenXML2];
SELECT TOP 1000 *
FROM dbo.[TFI_EDI_GenXML_Log]
ORDER BY [ID] DESC;
*/
--EXEC [TFI_EDI_WHSSTKTRANS2XML] 19145;

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
				FROM	dbo.sysobjects
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
	SET @filePath = 'D:\TFi\CG\943_xml\';
	SET @filePathArchive = 'D:\TFi\CG\archive\943_xml\';
	--print 'A';


	--holder of invoices to process
	CREATE TABLE #DocList
		(
		 [ID] INT IDENTITY(1,1)
		,[DocKey] INT
		);

	--list Invoices to process
	INSERT INTO #DocList
		([DocKey])
	SELECT
		DocEntry
		from
		[SQL01a].[BN_Taos].[dbo].odrf h (nolock)
		where
			h.objtype = '20'
			and
			h.DocStatus = 'O'
		ORDER BY h.DocEntry;
	SET @i0 = @@ROWCOUNT;
	SET @i1 = 1;

	INSERT INTO dbo.[TFI_EDI_GenXML_Log] (Message)
	VALUES ('Doc List ' + (CAST (@i0 AS NVARCHAR)));

	INSERT INTO dbo.[TFI_EDI_GenXML_Log] (Message)
	SELECT [DocKey] FROM #DocList ORDER BY [ID]

	--SELECT @i0, @i1;

	WHILE @i1 <= @i0
	BEGIN
	--set query to create the report
	SET @query = 'EXEC [SQL01a].[BN_Taos].[dbo].[TFI_EDI_WHSSTKTRANS2XML] ' + CAST((SELECT [DocKey] FROM #DocList WHERE [ID] = @i1) AS NVARCHAR);
	--select @query;
	-- generate the dynamic file name based on the date and time
	SET @Now =  replace(convert(varchar(8), GETDATE(), 112)+convert(varchar(8), GETDATE(), 114), ':','');
	SET @Now = substring(@Now ,3,15);
	SET @GUID = NEWID()
	--SELECT @NOW
	SET @sGUID = CONVERT(NVARCHAR(255), @GUID);
	--create the file name
	--SELECT @GUID
	SET @fileName = '943_' + @sGUID + '.xml';
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

		--UPDATE [OINV]
		--SET [U_EDIGen] = 'N'
		--WHERE [DocEntry] = (SELECT [DocEntry] FROM #DocList WHERE [ID] = @i1);

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

	DROP TABLE #DocList;
END
GO
