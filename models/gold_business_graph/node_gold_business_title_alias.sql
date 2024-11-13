{{ config(materialized='table') }}

select (tconst || '_' || cast(ordering as string)) as alias_id, title, region, language, types, attributes, isOriginalTitle
from {{ref('gold_business_title_alias')}}