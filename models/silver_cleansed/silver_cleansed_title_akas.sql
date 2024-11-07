{{ config(materialized='table') }}

select 
    titleId, 
    ordering, 
    title, 
    case when region in (select alpha2 from {{ref('region_codes')}}) then region else NULL end as region,
    case when language in (select alpha2 from {{ref('language_codes')}} ) then language else NULL end as language,
    types, 
    attributes, 
    isOriginalTitle
from {{ref('silver_casted_title_akas')}}
where titleId in (select tconst from {{ref('silver_cleansed_title_basics')}})