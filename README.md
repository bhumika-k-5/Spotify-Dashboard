# Spotify-Dashboard
Analysis of trends with respect to audio features in the music industry

# Using Excel
## 1. Data Cleaning & Preparation in Excel
Step 1 – Remove Duplicates
Selected the entire dataset (Ctrl + A).
Navigated to Data tab → Remove Duplicates under Data Tools.

Step 2 – Handling Missing Value
Selected dataset (Ctrl + A).
Used Home tab → Find & Select → Go To Special → Blanks to check for null values.
Confirmed no missing values were present.

Step 3 – Formatting
Column renaming via Data tab → Get & Transform Data → From Table/Range.
Changed danceability, energy, speechiness, acousticness, instrumentalness, valence to Percentage data type.
Converted release_date to Date data type
Applied Capitalize Each Word transformation to genre and subgenre columns.
Added a conditional column for "Mode"
If value = 1 → "Major"
Else → "Minor".

Step 4 – Handling Errors
Opened the query in Data tab → Queries & Connections → Edit.
Selected all columns (Ctrl + A) in Power Query.
Used Remove Rows → Remove Errors to delete rows with invalid data.

Step 5 – Extracting Year
Duplicated the release_date column.
Used Split Column → By Delimiter to separate year, month, day.
Removed month/day columns, retaining only the year column for analysis.

## 2. Data Visualization in Excel
Step 1 – Slicer for Genre Filtering
Added a slicer for the Genre column to allow users to filter all visuals simultaneously.
Connected the slicer to all pivot charts to make the dashboard dynamic

Step 2 – Popularity by Year
Created a column chart using Year (from release date) on the X-axis and the Sum of Popularity on the Y-axis.
Sorted years in ascending order to observe trends over time.

Step 3 – Popularity by Subgenre
Used a horizontal bar chart to display the Sum of Popularity for each Subgenre.
Sorted subgenres in descending order of popularity for quick comparison.

Step 4 – Number of Tracks by Genre
Created a column chart showing the Count of Tracks grouped by Genre.
Used data labels for exact track counts.

Step 5 – Energy & Danceability by Genre
Designed a combo chart with:
Column bars for average energy.
Line plot for average danceability.
Added secondary axis for danceability (percentage format) for better comparison.

Step 6 – Formatting & Layout
Applied consistent color themes for genres in all charts.
Adjusted axis titles, labels, and legends for readability.
Arranged charts in a grid layout for quick visual interpretation.
Added a green header bar with the dashboard title for a professional look.

# Using PowerBI

## 1.	Data cleaning:
Removed duplicates to ensure unique records.
Checked for missing values (blanks) — none found.
Renamed columns for consistency and clarity.
Converted numeric audio feature columns (danceability, energy, speechiness, acousticness, instrumentalness, valence) to Percentage format.
Converted release_date to Date type and extracted Year for trend analysis.
Applied proper case formatting to genre and subgenre.
Added a calculated column for Mode (1 = Major, 0 = Minor).
Removed rows with errors to maintain data integrity.

## 2.	Data modelling
Loaded cleaned dataset into Power BI.
Ensured proper data types for all fields (e.g., text for categories, date for release_date, decimal for popularity scores).
Created relationships between fact table (tracks) and any supporting lookup tables (e.g., genres, subgenres) for efficient filtering.
Built calculated column for Duration of track to be in minutes instead of milliseconds
Verified relationships and filters worked as intended with the slicers and visuals.

## 3.	Data Visualization in Power BI
KPIs (Key Performance Indicators)
Total Songs
Total Artists
Average Popularity
Total Playlists
Total Duration (Minutes)

Charts & Visuals
Bar Chart – Number of songs by subgenre.
Column Chart – Average values of audio attributes (danceability, energy, valence, etc.).
Donut Chart – Popularity distribution by musical mode (Major / Minor).

Slicers (Filters)
Genre
Year
Audio Features (e.g., danceability range, energy level).

# Using SQL

## Data Cleaning
Created spotify_cleaned table from spotify_songs by removing duplicates.
Formatted Release_Date to full date format and renamed columns with clear names & correct data types.
Checked for missing values in key columns.
Added ModeType (Major/Minor) and Release_Year columns.

## Data Analysis
Ran analysis queries:
Top 10 most popular songs.
Average popularity by genre.
Average danceability and energy by genre.
Most popular release year.
Mode type distribution.
