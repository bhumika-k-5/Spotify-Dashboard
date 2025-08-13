CREATE TABLE spotify_cleaned AS
SELECT DISTINCT *
FROM spotify_songs;

ALTER TABLE spotify_cleaned 
CHANGE COLUMN track_album_release_date Release_Date VARCHAR(10);

UPDATE spotify_cleaned
SET Release_Date = CONCAT(Release_Date, '-01-01')
WHERE LENGTH(Release_Date) = 4;

ALTER TABLE spotify_cleaned 
CHANGE COLUMN track_name Track VARCHAR(255),
CHANGE COLUMN track_artist Artist VARCHAR(255),
CHANGE COLUMN danceability Danceability DECIMAL(5,2),
CHANGE COLUMN energy Energy DECIMAL(5,2),
CHANGE COLUMN speechiness Speechiness DECIMAL(5,2),
CHANGE COLUMN acousticness Acousticness DECIMAL(5,2),
CHANGE COLUMN instrumentalness Instrumentalness DECIMAL(5,2),
CHANGE COLUMN valence Valence DECIMAL(5,2),
CHANGE COLUMN track_popularity Popularity INT,
CHANGE COLUMN playlist_genre Genre VARCHAR(100),
CHANGE COLUMN playlist_subgenre Subgenre VARCHAR(100),
CHANGE COLUMN mode Mode TINYINT;

SELECT *
FROM spotify_cleaned
WHERE Genre IS NULL
   OR Subgenre IS NULL
   OR Popularity IS NULL
   OR Release_Date IS NULL;
   
ALTER TABLE spotify_cleaned ADD COLUMN ModeType VARCHAR(10);
UPDATE spotify_cleaned
SET ModeType = CASE WHEN Mode = 1 THEN 'Major' ELSE 'Minor' END;

ALTER TABLE spotify_cleaned ADD COLUMN Release_Year INT;
UPDATE spotify_cleaned
SET Release_Year = YEAR(Release_Date);

-- 1. Top 10 Most Popular Songs
SELECT Track, Artist, Popularity
FROM spotify_cleaned
ORDER BY Popularity DESC
LIMIT 10;

-- 2. Average Popularity by Genre
SELECT Genre, ROUND(AVG(Popularity), 2) AS avg_popularity
FROM spotify_cleaned
GROUP BY Genre
ORDER BY avg_popularity DESC;

-- 3. Average Danceability and Energy by Genre
SELECT Genre, 
       ROUND(AVG(Danceability), 2) AS avg_danceability,
       ROUND(AVG(Energy), 2) AS avg_energy
FROM spotify_cleaned
GROUP BY Genre
ORDER BY avg_danceability DESC;

-- 4. Most Popular Year
SELECT Release_Year, ROUND(AVG(Popularity), 2) AS avg_popularity
FROM spotify_cleaned
GROUP BY Release_Year
ORDER BY avg_popularity DESC
LIMIT 1;

-- 5. Distribution of Mode Type (Major/Minor)
SELECT Mode, COUNT(*) AS total_tracks
FROM spotify_cleaned
GROUP BY Mode;


