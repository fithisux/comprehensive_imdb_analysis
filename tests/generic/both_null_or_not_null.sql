{% test both_null_or_not_null(model, column_name, column_name2) %}

select *
from {{model}}
where ( {{column_name}} is not null and {{column_name2}} is null) or ({{column_name2}} is not null and {{column_name}} is null)
{% endtest %}