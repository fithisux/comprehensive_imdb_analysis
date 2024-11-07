{{ config(materialized='table') }}

with tempdata as (
select * from {{ref('silver_cleansed_title_principals')}}
)
select tconst, nconst, array_agg({'category': category, 'characters': characters, 'job': job}) as description
from tempdata  group by tconst, nconst