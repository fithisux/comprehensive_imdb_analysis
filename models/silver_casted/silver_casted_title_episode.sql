{{ config(materialized='view') }}

with loaded_title_episode as (

    select

    cast(tconst as string) as tconst,
    cast(parentTconst as string) as parentTconst,
    cast(seasonNumber as integer) as seasonNumber,
    cast(episodeNumber as integer) as episodeNumber

    from {{ref('bronze_title_episode')}}

)

select * from loaded_title_episode