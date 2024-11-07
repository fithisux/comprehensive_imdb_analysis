{{ config(materialized='table') }}


SELECT 
*
from {{ref('silver_cleansed_name_basics')}}