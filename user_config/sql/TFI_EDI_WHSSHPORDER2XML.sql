SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ALTER PROCEDURE [dbo].[TFI_EDI_IN2XML](
--debug
DECLARE
	@i0 INT
	SET @i0 = (SELECT TOP 1 [DocEntry] FROM [OINV] WHERE [DocNum] = 100);
-- ) AS

SET NOCOUNT ON

SELECT
    '<?xml version="1.0" encoding="utf-8" ?>'
    +CAST(
        (SELECT
            -- Document
            'TFi' AS 'sender'
            ,'3102332500' AS 'receiver'
            ,'T' AS 'testindicator'
            ,h.CardCode
            ,h.DocNum
            ,LEFT((CONVERT(DATE, h.[DocDate], 120)), 10) AS [DocDate]
            ,LEFT((CONVERT(DATE, h.[DocDueDate], 120)), 10) AS [DocDueDate]
            ,LEFT((CONVERT(DATE, h.[CancelDate], 120)), 10) AS [CancelDate]
            ,h.NumAtCard
            ,h.ShipToCode
            ,ph.AbsEntry
                -- <NTE01>GFT</NTE01>
                -- <NTE02>Happy Birthday</NTE02>
                -- <SCAC>UPS</SCAC>
            ,h.U_SES_SLI_DN
            ,CASE 
                WHEN h.U_SES_RdrType = 'DS'
                THEN 
                    LEFT(ISNULL(a.BlockS, h.CardName), 60)
                ELSE  
                    CASE 
                        WHEN h.ShipToCode <> 'ship to'
                        THEN
                            LEFT(ISNULL(h.ShipToCode, h.CardName), 60)
                        ELSE
                            LEFT(h.CardName, 60)
                    END
                END AS [N102-ST] --Name
            ,ISNULL(h.PayToCode, h.CardName) AS [N102-BT]
            ,a.StreetS
            ,a.CityS
            ,a.StateS
            ,a.ZipCodeS
            ,ISNULL(a.CountryS, 'US') AS [CountryS]
            ,a.StreetB
            ,a.CityB
            ,a.StateB
            ,a.ZipCodeB
            ,ISNULL(a.CountryB, 'US') AS [CountryB]

            ,CASE
                WHEN ISNULL(h.U_SES_SLI_GMT, '') <> ''
                THEN
                    'GFT'
                ELSE
                    ''
                END AS [NTE01]
            ,LEFT(ISNULL(h.U_SES_SLI_GMT, ''), 80) AS [NTE02]

            -- '???'							as [W6601],					-- need to figure what to put here exactly
            --         s.U_SES_ShipCode				as [W6610],	
                -- Lines
            ,(SELECT 
                (SELECT 
                    ROW_NUMBER() OVER (ORDER BY r.ItemCode) AS 'LineRow'
                    ,pr.RelQtty
                    ,i.CodeBars
                    ,CASE 
                        WHEN ISNULL(r.U_ALL_CUSTOM_BP_NO,'') <> ''
                        THEN
                        r.U_ALL_CUSTOM_BP_NO
                        END AS [U_ALL_CUSTOM_BP_NO]
                    ,i.ItemName

                    FROM 
                        OPKL ph (NOLOCK) JOIN 
                        PKL1 pr (NOLOCK) ON ph.AbsEntry = pr.AbsEntry JOIN 
                        RDR1 r (NOLOCK) ON pr.OrderEntry = r.DocEntry and pr.OrderLine = r.linenum JOIN 
                        ORDR h (NOLOCK) ON r.DocEntry = h.DocEntry JOIN 
                        OITM i (NOLOCK) ON r.itemcode = i.itemcode LEFT JOIN 
                        RDR12 a (NOLOCK) ON h.DocEntry = a.DocEntry LEFT JOIN 
                        OSHP s (NOLOCK) ON h.TrnspCode = s.TrnspCode
                    WHERE
                        ph.Status = 'R'AND
                        ph.AbsEntry = 2
                    FOR XML PATH ('Line'), TYPE)
                FOR XML PATH ('Lines'), TYPE)

            FROM 
                OPKL ph (NOLOCK) JOIN 
                ORDR h (NOLOCK) ON ph.AbsEntry = h.DocEntry LEFT JOIN 
                RDR12 a (NOLOCK) ON h.DocEntry = a.DocEntry LEFT JOIN 
                OSHP s (NOLOCK) ON h.TrnspCode = s.TrnspCode
            WHERE
                ph.Status = 'R' AND
                ph.AbsEntry = 2
            FOR XML PATH('Document'), TYPE
        ) AS VARCHAR(MAX)
    ) AS XMLData
GO