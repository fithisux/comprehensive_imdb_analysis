{{ config(materialized='table') }}


select (tconst || '_' || nconst) as cast_id, description
from {{ref('gold_business_cast')}}