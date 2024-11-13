{{ config(materialized='table') }}


SELECT 
nconst, primaryName, birthYear, deathYear, primaryProfession
from {{ref('gold_business_name')}}