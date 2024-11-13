{{ config(materialized='table') }}

SELECT 
tconst, titleType, primaryTitle, originalTitle, isAdult, startYear, endYear, runtimeMinutes, genres, averageRating, numVotes, seasonNumber, episodeNumber
from {{ref('gold_business_title')}}