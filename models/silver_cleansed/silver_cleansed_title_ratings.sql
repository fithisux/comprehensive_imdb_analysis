{{ config(materialized='table') }}

select * from {{ref('silver_casted_title_ratings')}}
where tconst in (select tconst from {{ref('silver_cleansed_title_basics')}})