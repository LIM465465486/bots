SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[TFI_EDI_WHSSHPORDER2XML](
--debug
--DECLARE
	@i0 INT
	--SET @i0 = (SELECT TOP 1 AbsEntry FROM OPKL ph (NOLOCK) WHERE  ph.Status = 'R');
	--SET @i0 = 465075
) AS

SET NOCOUNT ON

SELECT
    '<?xml version="1.0" encoding="UTF-16" ?>'
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
			,s.U_SES_EDI_CODE
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
			--,CASE
			--	WHEN h.CardCode = 'C000141'
			--	THEN
			--		'PG'
			--	END AS 'N902'
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
			,CASE
                WHEN ISNULL(h.U_ALL_REF_IT,'') <> ''
                THEN
					h.U_ALL_REF_IT
                END AS [U_ALL_REF_IT]
			,CASE
                WHEN ISNULL(h.U_SES_SLI_DN,'') <> ''
                THEN
					h.U_SES_SLI_DN
                END AS [U_SES_SLI_DN]

                -- Lines
            ,(SELECT
                (SELECT
                    ROW_NUMBER() OVER (ORDER BY r.ItemCode) AS 'LineRow'
                    ,pr.RelQtty
					,i.ItemName
                    ,i.CodeBars
                    ,CASE
                        WHEN ISNULL(r.U_ALL_CUSTOM_BP_NO,'') <> ''
                        THEN
							r.U_ALL_CUSTOM_BP_NO
                        END AS [U_ALL_CUSTOM_BP_NO]
					,CASE
                        WHEN ISNULL (r.U_ALL_PackTypeCode,'') <> ''
                        THEN
							r.U_ALL_PackTypeCode
                        END AS [U_ALL_PackTypeCode]
					,CASE
                        WHEN ISNULL (r.U_SES_SLI_POP,'') <> ''
                        THEN
							r.U_SES_SLI_POP
                        END AS [U_SES_SLI_POP]

                    FROM
                        OPKL ph (NOLOCK) JOIN
                        PKL1 pr (NOLOCK) ON ph.AbsEntry = pr.AbsEntry JOIN
                        RDR1 r (NOLOCK) ON pr.OrderEntry = r.DocEntry and pr.OrderLine = r.linenum JOIN
                        ORDR h (NOLOCK) ON r.DocEntry = h.DocEntry JOIN
                        OITM i (NOLOCK) ON r.itemcode = i.itemcode LEFT JOIN
                        RDR12 a (NOLOCK) ON h.DocEntry = a.DocEntry LEFT JOIN
                        OSHP s (NOLOCK) ON h.TrnspCode = s.TrnspCode
                    WHERE
                        ph.AbsEntry = @i0 --AND
                        --ph.AbsEntry = 2
                    FOR XML PATH ('Line'), TYPE)
                FOR XML PATH ('Lines'), TYPE)

            FROM
                OPKL ph (NOLOCK) JOIN
                PKL1 pr (NOLOCK) ON ph.AbsEntry = pr.AbsEntry AND pr.PickEntry = 0 JOIN
                RDR1 r (NOLOCK) ON pr.OrderEntry = r.DocEntry and pr.OrderLine = r.linenum JOIN
                ORDR h (NOLOCK) ON r.DocEntry = h.DocEntry JOIN
                OITM i (NOLOCK) ON r.itemcode = i.itemcode LEFT JOIN
                RDR12 a (NOLOCK) ON h.DocEntry = a.DocEntry LEFT JOIN
                OSHP s (NOLOCK) ON h.TrnspCode = s.TrnspCode
            WHERE
                ph.AbsEntry = @i0 --AND
                --ph.AbsEntry = 2
            FOR XML PATH('Document'), TYPE
        ) AS VARCHAR(MAX)
    ) AS XMLData
GO