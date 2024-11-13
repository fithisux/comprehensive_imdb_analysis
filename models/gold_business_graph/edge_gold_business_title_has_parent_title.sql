{{ config(materialized='table') }}

select
tconst as from,
parentTconst as to 
from {{ ref('gold_business_title') }}