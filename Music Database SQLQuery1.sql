-- Task One
SELECT * FROM Genre ORDER BY [Label];

-- Task Two
SELECT * FROM Artist ORDER BY ArtistName;

-- Task Three
SELECT
    s.Id,
    s.Title,
    a.ArtistName
FROM Song s
JOIN Artist a ON s.ArtistId = a.Id
ORDER BY Title;

-- Task Four
SELECT DISTINCT
    ar.Id,
    ar.ArtistName,
    g.[Label]
FROM Artist ar
JOIN Album al ON ar.Id = al.ArtistId
JOIN Genre g ON al.GenreId = g.Id
WHERE g.[Label] = 'Pop'
ORDER BY ArtistName;

-- Task Five
SELECT DISTINCT
    ar.Id,
    ar.ArtistName,
    g.[Label]
FROM Artist ar
JOIN Album al ON ar.Id = al.ArtistId
JOIN Genre g ON al.GenreId = g.Id
WHERE g.[Label] = 'Jazz' OR g.[Label] = 'Rock'
ORDER BY ArtistName;

-- Task Six
SELECT DISTINCT
    al.Id,
    al.Title
FROM Album al
LEFT JOIN Song s ON al.Id = s.AlbumId
WHERE s.AlbumId IS NULL
ORDER BY Title;

-- Task Seven
--INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Blind Guardian', 1984);

-- Task Eight
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Somewhere Far Beyond', '06/30/1992', 3325, 'Virgin/Century Media', 28, 5);
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Nightfall in Middle-Earth', '07/28/1998', 3929, 'Virgin/Century Media', 28, 5);
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('A Night at the Opera', '03/25/2002', 4021, 'Virgin/Century Media', 28, 5);

-- Task Nine
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Somewhere Far Beyond', 448, '06/30/1992', 5, 28, 23);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Ashes to Ashes', 358, '06/30/1992', 5, 28, 23);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('The Bard''s Song – In the Forest', 189, '06/30/1992', 2, 28, 23);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('The Curse of Fëanor', 341, '07/28/1998', 5, 28, 24);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Time Stands Still (At the Iron Hill)', 293, '07/28/1998', 5, 28, 24);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Nightfall', 334, '07/28/1998', 5, 28, 24);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('And Then There Was Silence', 846, '03/25/2002', 5, 28, 25);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Age of False Innocence', 365, '03/25/2002', 5, 28, 25);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Wait for an Answer', 390, '03/25/2002', 5, 28, 25);

-- Task Ten
SELECT
    s.Title,
    al.Title,
    ar.ArtistName
FROM Song s
LEFT JOIN Album al ON al.Id = s.AlbumId
LEFT JOIN Artist ar ON ar.Id = s.ArtistId
WHERE ar.ArtistName = 'Blind Guardian' OR al.Title = 'Somewhere Far Beyond' OR al.Title = 'Nightfall in Middle-Earth' OR al.Title = 'A Night at the Opera' 
ORDER BY s.Title;

-- Task Eleven
SELECT
    a.Title,
    COUNT(s.Title) AS 'Number of Songs'
FROM Album a
JOIN Song s ON a.Id = s.AlbumId
GROUP BY a.Title
ORDER BY a.Title;

-- Task Twelve
SELECT
    a.ArtistName,
    COUNT(s.Title) AS 'Number of Songs'
FROM Artist a
JOIN Song s ON a.Id = s.ArtistId
GROUP BY a.ArtistName
ORDER BY a.ArtistName;

-- Task Thirteen
SELECT
    g.[Label],
    COUNT(s.Title) AS 'Number of Songs'
FROM Genre g
JOIN Song s ON g.Id = s.GenreId
GROUP BY g.[Label]
ORDER BY g.[Label];

-- Task Fourteen NOT DONE
SELECT
    ar.ArtistName,
    COUNT(al.[Label]) AS 'Number of Labels'
FROM Artist ar
JOIN Album al ON ar.Id = al.ArtistId
GROUP BY ar.ArtistName HAVING COUNT(al.[Label]) > 1
ORDER BY ar.ArtistName;

-- Task Fifteen NOT DONE CORRECTLY
SELECT
    Title,
    MAX(AlbumLength) AS 'Album Length'
FROM Album
WHERE AlbumLength > 4000
GROUP BY Title;

-- Task Sixteen NOT DONE CORRECTLY
SELECT
    Title,
    MAX(SongLength) AS 'Song Length'
FROM Song
WHERE SongLength > 900
GROUP BY Title;

-- Task Seventeen NOT DONE && NOT DONE CORRECTLY
SELECT
    s.Title,
    --a.Title,
    MAX(SongLength) AS 'Song Length'
FROM Song s
JOIN Album a ON a.Id = s.AlbumId
WHERE SongLength > 900
GROUP BY s.Title;