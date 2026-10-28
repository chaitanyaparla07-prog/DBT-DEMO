{{config(materialized = 'table')}}
WITH CTE AS(
select  DISTINCT START_STATION_ID AS STATION_ID,
START_STATION_NAME AS STATION_NAME,
START_LAT,
START_LNG from 
{{ source('demo', 'PARLA_RAW') }}
WHERE RIDE_ID  != 'ride_id')
SELECT * FROM CTE 