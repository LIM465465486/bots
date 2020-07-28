DECLARE @xml xml
SELECT @xml = CAST(CAST((SELECT data FROM payload) AS VARBINARY(MAX)) AS XML)

--  Iterate through each of the "users\user" records in our XML
SELECT
    x.Rec.query('./ST02').value('.', 'nvarchar(2000)') AS 'ST02',
    x.Rec.query('./W0602').value('.', 'nvarchar(2000)') AS 'W0602',
    x.Rec.query('./W0603').value('.', 'nvarchar(2000)') AS 'W0603',
    x.Rec.query('./W0604').value('.', 'nvarchar(2000)') AS 'W0604',
    x.Rec.query('./W0605').value('.', 'nvarchar(2000)') AS 'W0605'
FROM @xml.nodes('/Document') as x(Rec)