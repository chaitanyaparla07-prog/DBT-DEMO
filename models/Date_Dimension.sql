{{ config(materialized='table') }}
WITH cte AS (
    SELECT TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
    dayofweek(TO_TIMESTAMP(STARTED_AT)) AS DAYOFWEEK_STARTEDAT, {{function1('started_at')}},
    {{function2('started_at')}}
    FROM {{ source('demo', 'PARLA_RAW') }}
    WHERE LOWER(TRIM(STARTED_AT)) <> 'started_at'
)

SELECT *
FROM cte