{{ config(materialized='table') }}

select
tconst as from,
unnest(writers) as to 
from {{ ref('gold_business_title') }}