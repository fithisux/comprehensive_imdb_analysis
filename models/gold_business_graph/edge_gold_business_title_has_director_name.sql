{{ config(materialized='table') }}

select
tconst as from,
unnest(directors
) as to 
from {{ ref('gold_business_title') }}