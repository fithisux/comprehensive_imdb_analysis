{{ config(materialized='table') }}

select
(tconst || '_' || cast(ordering as string)) as from,
tconst as to
from {{ ref('gold_business_title_alias') }}