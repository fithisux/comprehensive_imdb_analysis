{{ config(materialized='table') }}


SELECT 
    nconst,
    primaryName,
    birthYear,
    deathYear,
    primaryProfession,
    list_sort(t2.knownForTitles) as knownForTitles
from {{ref('silver_casted_name_basics')}} t,
LATERAL (select flatten(array_agg(xxx)) from (
    SELECT [knownForTitle] as xxx
    from (select unnest(t.knownForTitles) as knownForTitle)
    where knownForTitle in (select tconst from {{ref('silver_cleansed_title_basics')}})
    UNION ALL 
    SELECT [] as xxx
)) t2(knownForTitles)
where primaryName is not NULL