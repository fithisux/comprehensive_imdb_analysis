{{ config(materialized='table') }}

select
(tconst || '_' || nconst) as from,
tconst as to 
from {{ ref('gold_business_cast') }}