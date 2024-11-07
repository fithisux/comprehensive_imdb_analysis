{{ config(materialized='view') }}

with loaded_crew as (

    select

    cast(tconst as string) as tconst,
    case when directors is not null then regexp_split_to_array(directors, ',') else [] end as directors,
    case when writers is not null then regexp_split_to_array(writers, ',') else [] end as writers

    from {{ref('bronze_title_crew')}}

)

select * from loaded_crew