{{ config(materialized='table') }}

select aa.*, bb.directors, bb.writers, cc.averageRating, cc.numVotes, dd.parentTconst, dd.seasonNumber, dd.episodeNumber
from {{ref('silver_cleansed_title_basics')}} aa 
left join {{ref('silver_cleansed_title_crew')}} bb on aa.tconst=bb.tconst
left join {{ref('silver_cleansed_title_ratings')}} cc on aa.tconst=cc.tconst
left join {{ref('silver_cleansed_title_episode')}} dd on aa.tconst=dd.tconst