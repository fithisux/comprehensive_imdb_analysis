{{ config(materialized='table') }}

select * from {{ref('silver_casted_title_principals')}}
where tconst in (select tconst from {{ref('silver_cleansed_title_basics')}})
and nconst in (select nconst from {{ref('silver_cleansed_name_basics')}})