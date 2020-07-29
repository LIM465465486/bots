USE [TFi]
GO

DECLARE @xml xml
SELECT @xml = CAST(CAST((SELECT [data] FROM [payload]) AS VARBINARY(MAX)) AS XML)

--  Iterate through each of the "users\user" docords in our XML
SELECT
    h.doc.query('./ST02').value('.', 'nvarchar(2000)') AS 'ST02',
    h.doc.query('./W0602').value('.', 'nvarchar(2000)') AS 'W0602',
    h.doc.query('./W0603').value('.', 'nvarchar(2000)') AS 'W0603',
    h.doc.query('./W0604').value('.', 'nvarchar(2000)') AS 'W0604',
    h.doc.query('./W0605').value('.', 'nvarchar(2000)') AS 'W0605'
    INTO #h
    FROM @xml.nodes('/Document') as h(doc)


SELECT
    l.line.query('./ST02').value('.', 'nvarchar(2000)') AS 'ST02',
    l.line.query('./LX01').value('.', 'INT') AS 'LX01',
    l.line.query('./MAN01').value('.', 'nvarchar(2000)') AS 'MAN01',
    l.line.query('./MAN02').value('.', 'nvarchar(2000)') AS 'MAN02',
    l.line.query('./W1201').value('.', 'nvarchar(2000)') AS 'W1201',
    l.line.query('./W1202').value('.', 'nvarchar(2000)') AS 'W1202',
    l.line.query('./W1203').value('.', 'nvarchar(2000)') AS 'W1203',
    l.line.query('./W1205').value('.', 'nvarchar(2000)') AS 'W1205',
    l.line.query('./W1206').value('.', 'nvarchar(2000)') AS 'W1206',
    l.line.query('./W1207').value('.', 'nvarchar(2000)') AS 'W1207',
    l.line.query('./W1208').value('.', 'nvarchar(2000)') AS 'W1208',
    l.line.query('./W1210').value('.', 'nvarchar(2000)') AS 'W1210',
    l.line.query('./W1211').value('.', 'nvarchar(2000)') AS 'W1211',
    l.line.query('./W1212').value('.', 'nvarchar(2000)') AS 'W1212'
    INTO #l
    FROM @xml.nodes('/Document/Lines/Line') as l(line)

-- SELECT
--     *
--     FROM #h
-- SELECT
--     *
--     FROM #l

SELECT
    t0.*,
    t1.*
    FROM #h t0 JOIN #l t1 ON t0.ST02 = t1.ST02
    ORDER BY LX01

DROP TABLE #h
DROP TABLE #l