{{ config(materialized='table') }}

select titleId as tconst, ordering, title, region, language, types, attributes, isOriginalTitle
from {{ref('silver_cleansed_title_akas')}}