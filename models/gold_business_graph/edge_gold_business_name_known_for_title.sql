{{ config(materialized='table') }}

select
nconst as from,
unnest(knownForTitles) as to 
from {{ ref('gold_business_name') }}