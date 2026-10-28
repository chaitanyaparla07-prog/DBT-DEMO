{% macro function1(x) %}

CASE
    WHEN TO_TIMESTAMP({{ x }}) < CURRENT_TIMESTAMP() THEN 'PAST'
    ELSE 'FUTURE'
END

{% endmacro %}