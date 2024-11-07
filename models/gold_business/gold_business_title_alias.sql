{{ config(materialized='table') }}

select * from {{ref('silver_cleansed_title_akas')}}