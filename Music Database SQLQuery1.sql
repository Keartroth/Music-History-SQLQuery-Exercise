-- Task One
-- Query all of the entries in the Genre table
SELECT * FROM Genre ORDER BY [Label];

-- Task Two
-- Query all the entries in the Artist table and order by the artist's name.
SELECT * FROM Artist ORDER BY ArtistName;

-- Task Three
-- Write a SELECT query that lists all the songs in the Song table and include the Artist name.
SELECT
    s.Id,
    s.Title AS 'Song Title',
    a.ArtistName AS 'Artist Name'
FROM Song s
JOIN Artist a ON s.ArtistId = a.Id
ORDER BY Title;

-- Task Four
-- Write a SELECT query that lists all the Artists that have a Heavy Metal Album.
-- Yes, there are no Pop albums. This is Steve pointing out his superior musical taste.
SELECT DISTINCT
    ar.Id,
    ar.ArtistName AS 'Artist Name',
    g.[Label] AS 'Genre'
FROM Artist ar
JOIN Album al ON ar.Id = al.ArtistId
JOIN Genre g ON al.GenreId = g.Id
WHERE g.[Label] = 'Heavy Metal'
ORDER BY ArtistName;

-- Task Five
-- Write a SELECT query that lists all the Artists that have a Jazz or Rock Album.
SELECT DISTINCT
    ar.Id,
    ar.ArtistName AS 'Artist Name',
    g.[Label] AS 'Genre'
FROM Artist ar
JOIN Album al ON ar.Id = al.ArtistId
JOIN Genre g ON al.GenreId = g.Id
WHERE g.[Label] = 'Jazz' OR g.[Label] = 'Rock'
ORDER BY ArtistName;

-- Task Six
-- Write a SELECT statement that lists the Albums with no songs.
SELECT DISTINCT
    al.Id,
    al.Title AS 'Album Title'
FROM Album al
LEFT JOIN Song s ON al.Id = s.AlbumId
WHERE s.AlbumId IS NULL
ORDER BY Title;

-- Task Seven
-- Using the INSERT statement, add one of your favorite artists to the Artist table.
--INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Blind Guardian', 1984);

-- Task Eight
-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Somewhere Far Beyond', '06/30/1992', 3325, 'Virgin/Century Media', 28, 5);
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Nightfall in Middle-Earth', '07/28/1998', 3929, 'Virgin/Century Media', 28, 5);
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('A Night at the Opera', '03/25/2002', 4021, 'Virgin/Century Media', 28, 5);

-- Task Nine
-- Using the INSERT statement, add some songs that are on that album to the Song table.
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
-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in.
-- Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT
    s.Title AS 'Song Title',
    al.Title AS 'Album Title',
    ar.ArtistName AS 'Artist Name'
FROM Song s
LEFT JOIN Album al ON al.Id = s.AlbumId
LEFT JOIN Artist ar ON ar.Id = s.ArtistId
WHERE ar.ArtistName = 'Blind Guardian' OR al.Title = 'Somewhere Far Beyond' OR al.Title = 'Nightfall in Middle-Earth' OR al.Title = 'A Night at the Opera' 
ORDER BY s.Title;

-- Task Eleven
-- Write a SELECT statement to display how many songs exist for each album. 
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT
    a.Title AS 'Album Title',
    COUNT(s.Title) AS 'Number of Songs'
FROM Album a
JOIN Song s ON a.Id = s.AlbumId
GROUP BY a.Title
ORDER BY a.Title;

-- Task Twelve
-- Write a SELECT statement to display how many songs exist for each artist.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT
    a.ArtistName AS 'Artist Name',
    COUNT(s.Title) AS 'Number of Songs'
FROM Artist a
JOIN Song s ON a.Id = s.ArtistId
GROUP BY a.ArtistName
ORDER BY a.ArtistName;

-- Task Thirteen
-- Write a SELECT statement to display how many songs exist for each genre.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT
    g.[Label] AS 'Genre',
    COUNT(s.Title) AS 'Number of Songs'
FROM Genre g
JOIN Song s ON g.Id = s.GenreId
GROUP BY g.[Label]
ORDER BY g.[Label];

-- Task Fourteen
-- Write a SELECT query that lists the Artists that have put out records on more than one record label.
-- Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword.
SELECT
    ar.ArtistName AS 'Artist Name',
    COUNT(DISTINCT al.[Label]) AS 'Number of Labels'
FROM Artist ar
JOIN Album al ON al.ArtistId = ar.Id
GROUP BY ar.ArtistName
HAVING COUNT(DISTINCT al.[Label]) > 1;

-- Task Fifteen
-- Using MAX() function, write a select statement to find the album with the longest duration.
-- The result should display the album title and the duration.
SELECT
    Title AS 'Album Title',
    AlbumLength AS 'Album Length'
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album);

-- Thug isn't 15 minutes long....
-- UPDATE Song
-- SET SongLength = 257
-- WHERE Id = 13;

-- Dirt Off Your Shoulder isn't 14 minutes long...
-- UPDATE Song
-- SET SongLength = 239
-- WHERE Id = 21;

-- Task Sixteen
-- Using MAX() function, write a select statement to find the song with the longest duration.
-- The result should display the song title and the duration.
SELECT
    Title AS 'Song Title',
    SongLength AS 'Song Length'
FROM Song
WHERE SongLength = (SELECT MAX(SongLength) FROM Song);

-- Task Seventeen
--Modify the previous query to also display the title of the album.
SELECT
    s.Title AS 'Song Title',
    s.SongLength AS 'Song Length',
    a.Title AS 'Album Title'
FROM Song s
JOIN Album a ON a.Id = s.AlbumId
WHERE s.SongLength = (SELECT MAX(SongLength) FROM Song);