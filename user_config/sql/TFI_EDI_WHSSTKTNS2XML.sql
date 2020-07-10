SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[TFI_EDI_WHSSTKTRANS2XML](
--debug
--DECLARE
	@i0 INT
	--SET @i0 = (SELECT TOP 1 AbsEntry FROM OPKL ph (NOLOCK) WHERE  ph.Status = 'R');
	--SET @i0 = 13739
) AS

SET NOCOUNT ON

select
	h.DocEntry,
	LEFT((CONVERT(DATE, h.[DocDueDate], 120)), 10) AS [DocDueDate],
	h.NumAtCard,
	h.CardName,
	w.Street,
	w.Address3,
	w.City,
	w.State,
	w.ZipCode,
	w.Country,
	s.TrnspName,
	r.Quantity,
	ISNULL(i.CodeBars,b.BcdCode) as 'CodeBars'
into #T1
from
	odrf h (nolock)
	inner join
	drf1 r (nolock) on h.docentry = r.docentry
	inner join
	owhs w (nolock) on r.whscode = w.WhsCode
	inner join
	oshp s (nolock) on h.TrnspCode = s.TrnspCode
	inner join
	oitm i (nolock) on r.itemcode = i.itemcode
	left join
	OBCD b (nolock) on i.itemcode = b.ItemCode

where
	h.objtype = '20'
	and
	h.DocStatus = 'O'

INSERT INTO #T1
select
	h.DocEntry,
	LEFT((CONVERT(DATE, h.[DocDueDate], 120)), 10) AS [DocDueDate],
	h.NumAtCard,
	'Taos Footwear' as CustomerName,
	w.Street,
	w.Address2,
	w.City,
	w.State,
	w.ZipCode,
	w.Country,
	s.TrnspName,
	r.Quantity,
	ISNULL(i.CodeBars,b.BcdCode) as 'CodeBars'
from
	owtq h (nolock)
	inner join
	WTQ1 r (nolock) on h.docentry = r.docentry
	inner join
	owhs w (nolock) on r.whscode = w.WhsCode
	left join
	oshp s (nolock) on h.TrnspCode = s.TrnspCode
	inner join
	oitm i (nolock) on r.itemcode = i.itemcode
	left join
	OBCD b (nolock) on i.itemcode = b.ItemCode

where
	r.whscode like '%in%'
	and
	h.DocStatus = 'O'

--SELECT * FROM #T0;
SELECT DISTINCT
	DocEntry,
	DocDueDate,
	NumAtCard,
	CardName,
	Street,
	Address3,
	City,
	State,
	ZipCode,
	Country,
	TrnspName
	INTO #T0
	FROM #T1

SELECT
    '<?xml version="1.0" encoding="UTF-16" ?>'
    +CAST(
        (SELECT
            -- Document
            'TFi' AS 'sender'
            ,'3102332500' AS 'receiver'
            ,'T' AS 'testindicator'
			,DocEntry
			,NumAtCard
			,CardName
			,Street
			,Address3
			,City
			,State
			,ZipCode
			,Country
			,TrnspName

			-- Lines
            ,(SELECT
                (SELECT
                    Quantity
					,CodeBars
                    FROM #T1
					WHERE DocEntry = 13739
                    FOR XML PATH ('Line'), TYPE)
                FOR XML PATH ('Lines'), TYPE)

			FROM #T0
			WHERE DocEntry = 13739
			FOR XML PATH('Document'), TYPE
					) AS VARCHAR(MAX)
				) AS XMLData

DROP TABLE #T0;
DROP TABLE #T1;
GO