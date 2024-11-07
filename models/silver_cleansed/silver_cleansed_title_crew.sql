{{ config(materialized='table') }}

SELECT 
    tconst,
    list_sort(t2.writers) as writers,
    list_sort(t3.directors) as directors
from {{ref('silver_casted_title_crew')}} t,
LATERAL (
select flatten(array_agg(xxx1)) from (
	    SELECT [writer] as xxx1
	    from (select unnest(t.writers) as writer)
	    where writer in (select nconst from {{ref('silver_cleansed_name_basics')}})
	    UNION ALL 
	    SELECT [] as xxx1
	)
) t2(writers),  
LATERAL (
select flatten(array_agg(xxx2)) from (
	    SELECT [director] as xxx2
	    from (select unnest(t.directors) as director)
	    where director in (select nconst from {{ref('silver_cleansed_name_basics')}})
	    UNION ALL 
	    SELECT [] as xxx2
	)
) t3(directors)
where tconst in (select tconst from {{ref('silver_cleansed_title_basics')}})