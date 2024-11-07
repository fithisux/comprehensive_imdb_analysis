{{ config(materialized='table') }}

select * from {{ref('silver_casted_title_episode')}}
where tconst in (select tconst from {{ref('silver_cleansed_title_basics')}})
and parentTconst in (select tconst from {{ref('silver_cleansed_title_basics')}})