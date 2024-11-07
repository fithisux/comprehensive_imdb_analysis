{% test array_struct_field_is_not_null(model, column_name, field_name) %}

with exploded as (
    select unnest({{column_name}}) as temp
    from {{model}}
)
select *
from exploded
where (temp).{{field_name}} is null
{% endtest %}