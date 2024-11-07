{{ config(materialized='table') }}

SELECT * from {{ref('silver_casted_title_basics')}}