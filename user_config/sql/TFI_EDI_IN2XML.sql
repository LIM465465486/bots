SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[TFI_EDI_IN2XML](
--debug
-- DECLARE
	@i0 INT
-- 	SET @i0 = (SELECT TOP 1 [DocEntry] FROM [OINV] WHERE [DocNum] = 100);
) AS


SET NOCOUNT ON

SELECT '<?xml version="1.0" encoding="utf-8" ?>' +
CAST((
    SELECT
    --header
    --'LUKASIAN3' as 'sender'
        (CASE i.[CardCode]
             WHEN 'Dol Gnrl' THEN 'LUKASIAN1'
             WHEN 'BBB' THEN 'LUKASIAN3'
             WHEN 'WM' THEN 'LUKASIANHSEWM'
            END
            ) AS 'sender'
    , (CASE
           WHEN (i.[CardCode] = 'BBB') AND (LEFT(i.[NumAtCard], 1) = 'C') THEN '9086886731'
           WHEN (i.[CardCode] = 'BBB') AND (LEFT(i.[NumAtCard], 1) <> 'C') THEN '9086880888'
           WHEN i.[CardCode] = 'Dol Gnrl' THEN '069331990INET'
           WHEN i.[CardCode] = 'WM' THEN '925485US00'
           ELSE '' END
            ) AS 'receiver'
    --  *01*LUKASIAN1      *01*069331990INET
    , 'P' AS 'testindicator'
    , c.[AddID] AS 'vendorno'
    , 'SA' AS 'docsrt'
    , (CASE i.[CardCode]
           WHEN 'BBB' THEN 'CC'
           WHEN 'WM' THEN 'CC'
    END
            ) AS 'fob'
    , (CASE i.[CardCode]
           WHEN 'Dol Gnrl' THEN '01'
           WHEN 'WM' THEN '08'
    END
            ) AS 'termsID'
    , (CASE i.[CardCode]
           WHEN 'Dol Gnrl' THEN '180'
           WHEN 'WM' THEN '60'
    END
            ) AS 'termsnetdays'
    , (CASE i.[CardCode]
           WHEN 'WM' THEN '1'
    END
            ) AS 'termsdiscountpercent'
    , (CASE i.[CardCode]
           WHEN 'WM' THEN '7'
    END
            ) AS 'termsdiscountdays'
    , i.[DocNum] AS 'docnum'
    , LEFT((CONVERT(DATE, i.[DocDate], 120)), 10) AS 'docdtm'
    --,LEFT((CONVERT(DATE,'2018-10-02', 120)),10) AS 'docdtm'

    --,(CASE i.[CardCode]
    --	WHEN 'BBB' THEN LEFT((CONVERT(DATE,'2018-10-02', 120)),10)
    --	ELSE LEFT((CONVERT(DATE,i.[DocDate], 120)),10)
    --	END
    --	)AS 'docdtm'

    , (CASE i.[CardCode]
           WHEN 'BBB' THEN LEFT((CONVERT(DATE, i.[DocDate], 120)), 10)
    --WHEN 'BBB' THEN LEFT((CONVERT(DATE,'2018-10-02', 120)),10)
           WHEN 'WM' THEN LEFT((CONVERT(DATE, (ISNULL('2020-1-1', i.[DocDate])), 120)), 10)
    END
            ) AS 'dlvdtm'
    , LEFT((CONVERT(DATE, '2020-1-1', 120)), 10) AS 'podtm'
    , i.[NumAtCard] AS 'ordernumber'
    , CONVERT(NUMERIC(19, 2), i.[DocTotal]) AS 'totalinvoiceamount'
    , (CASE i.[CardCode] WHEN 'WM' THEN '00074' END) AS 'DP'
    , (CASE i.[CardCode] WHEN 'WM' THEN '0033' END) AS 'MR'
    , (CASE i.[CardCode] WHEN 'WM' THEN '01-' + c.[AddID] END) AS 'AN'

    --partys
    , (SELECT
            --Remmitance Address
           CASE i.[CardCode]
               WHEN 'Dol Gnrl' THEN
                   (SELECT 'RI'              as 'qual'
                         , 'Lukasian House'  AS 'name1'
                         , '9'               as 'typeID'
                         , 'LUKASIAN10000'   as 'externalID'
                         , 'ACCT DEPT'       as 'name2'
                         , '500 S. Palm Ave' as 'address1'
                         , 'Alhambra'        as 'city'
                         , 'CA'              as 'state'
                         , '91803'           as 'zipcode'
                         , 'US'              as 'country'
                    FOR XML PATH('party'), TYPE)
               WHEN 'WM' THEN
                   (SELECT 'SU'                 as 'qual'
                         , 'LUKASIAN HOUSE LLC' AS 'name1'
                    FOR XML PATH('party'), TYPE)
               END
            --Ship To
            , CASE i.[CardCode]
                  WHEN 'Dol Gnrl' THEN
                      (SELECT 'ST'                  as 'qual'
                            , 'DOLLAR GENERAL CORP' AS 'name1'
                            --,'92' as 'qual'
                            , '92'                  as 'typeID'
                            --,i.[ShipToCode] as 'externalID'
                            , c1.[Address]          as 'externalID'
                            , ''                    as 'name2'
                            , c1.[Street]           as 'address1'
                            , c1.[City]             as 'city'
                            , c1.[State]            as 'state'
                            , c1.[ZipCode]          as 'zipcode'
                            , c1.[Country]          as 'country'
                       FROM [OINV] i
                                INNER JOIN [CRD1] c1
                                           ON i.[ShipToCode] = c1.[Address] AND c1.[AdresType] = 'S'
                            --ON c1.[Address] = '96700' AND c1.[AdresType] = 'S'
                       WHERE i.[DocEntry] = @i0
                       FOR XML PATH('party'), TYPE)
                  WHEN 'WM' THEN
                      (SELECT 'ST'           as 'qual'
                            , ''             AS 'name1'
                            --,'92' as 'qual'
                            , 'UL'           as 'typeID'
                            , i.[ShipToCode] as 'externalID'
                            , c1.[Street]    as 'address1'
                            , c1.[City]      as 'city'
                            , c1.[State]     as 'state'
                            , c1.[ZipCode]   as 'zipcode'
                       FROM [OINV] i
                                INNER JOIN [CRD1] c1
                                           ON i.[ShipToCode] = c1.[Address] AND c1.[AdresType] = 'S'
                       WHERE i.[DocEntry] = @i0
                       FOR XML PATH('party'), TYPE)
                  WHEN 'BBB' THEN
                      (SELECT 'BY'           as 'qual'
                            , ''             AS 'name1'
                            , '92'           as 'typeID'
                            , i.[ShipToCode] as 'externalID'
                       FROM [OINV] i
                                INNER JOIN [CRD1] c1
                                           ON i.[ShipToCode] = c1.[Address] AND c1.[AdresType] = 'S'
                       WHERE i.[DocEntry] = @i0
                       FOR XML PATH('party'), TYPE)
        END
       FOR XML PATH('partys'), TYPE)
    --N1*ST*WAL-MART DC 6017A-ASM DIS*UL*0078742029276~
--N3*2108 EAST TIPTON STREET~
--N4*SEYMOUR*IN*47274~

--N1*RI*Lukasian House*9*LUKASIAN10000~
--N2*ACCT DEPT~
--N3*500 S. Palm Ave~
--N4*Alhambra*CA*91803*US~

--N1*ST*DOLLAR GENERAL CORP*92*96970~
--N2*Lebec DC~
--N3*4193 Industrial Pkwy Drive~
--N4*Lebec*CA*93243*US~

    --lines
    , (SELECT (SELECT ROW_NUMBER() OVER (ORDER BY a.[ItemCode]) AS 'linenum'
                    , a.[upc]
                    , a.[ItemCode]                              as 'itemcode'
                    , a.[Substitute]                            as 'substitute'
                    , a.[SubstituteID]                          as 'substituteID'
                    , CAST(a.[invqua] AS INT)                   AS 'invqua'
                    , a.[ordunit]
                    , CAST(a.[price] AS NUMERIC(19, 2))         AS 'price'
               FROM (
                        SELECT ''            AS 'upc'
                             , ''            AS 'ItemCode'
                             , ''            AS 'SubstituteID'
                             , ''            AS 'Substitute'
                             , il.[Quantity] AS 'invqua'
                             , ''            AS 'ordunit'
                             , il.[Price]    AS 'price'
                        FROM [OINV] i
                                 INNER JOIN [INV1] il
                                            ON i.[DocEntry] = il.[DocEntry]
                                 INNER JOIN [OSCN] cat
                                            ON il.[ItemCode] = cat.[ItemCode] AND (cat.[CardCode] = 'BBB')
                        WHERE il.[DocEntry] = @i0
                          AND i.[CardCode] = 'BBB'
                        UNION ALL
                        SELECT i.[CodeBars]            AS 'upc'
                             --,l.[ItemCode] AS 'ItemCode'
                             , ''                      AS 'ItemCode'
                             , 'CB'                    AS 'SubstituteID'
                             , i.FrgnName              AS 'Substitute'
                             , CAST(l.Quantity AS INT) AS 'invqua'
                             , 'EA'                    AS 'ordunit'
                             , CAST(l.Price AS MONEY)  AS 'Price'
                        FROM [OINV] h
                                 INNER JOIN [INV1] l ON h.[DocEntry] = l.[DocEntry]
                                 JOIN [OITM] i ON l.ItemCode = i.ItemCode
                        WHERE l.[DocEntry] = @i0
                          AND l.[TreeType] <> 'I'
                          AND h.[CardCode] = 'Dol Gnrl'


                        UNION ALL
                        SELECT i.[CodeBars]
                             , ''                                                              AS 'ItemCode'
                             , ''                                                              AS 'SubstituteID'
                             , ''                                                              AS 'Substitute'
                             , SUM(CONVERT(INT, (l.[Quantity])))                               AS 'invqua'
                             , 'EA'                                                            AS 'ordunit'
                             , SUM(CONVERT(NUMERIC(19, 2), (l.[Price]))) / COUNT(i.[CodeBars]) AS 'Price'
                        FROM [OINV] h
                                 INNER JOIN [INV1] l ON h.[DocEntry] = l.[DocEntry]
                                 JOIN [OITM] i ON l.ItemCode = i.ItemCode
                        WHERE l.[DocEntry] = @i0
                          AND h.[CardCode] = 'WM'
                          AND (i.[CodeBars] <> '' OR i.[CodeBars] IS NOT NULL)
                        GROUP BY i.[CodeBars]
                    ) a
               ORDER BY [linenum]
               FOR XML PATH ('line'), TYPE)
       FOR XML PATH ('lines'), TYPE)
        FROM [OINV] i
        INNER JOIN [OCRD] c
        ON i.[CardCode] = c.[CardCode]
        WHERE i.[DocEntry] = @i0
        FOR XML PATH('Document'), TYPE
    ) AS VARCHAR(MAX)) AS XmlData
GO
