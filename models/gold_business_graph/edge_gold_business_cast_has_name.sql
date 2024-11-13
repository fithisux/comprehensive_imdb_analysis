{{ config(materialized='table') }}

select
(tconst || '_' || nconst) as from,
nconst as to 
from {{ ref('gold_business_cast') }}