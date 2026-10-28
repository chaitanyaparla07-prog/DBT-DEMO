{{config(materialized = 'table')}}
with cte as(
SELECT
        t.RIDE_ID,
        t.RIDEABLE_TYPE,
        t.DATE_STARTED_AT,
        t.START_STATION_ID,
        t.END_STATION_ID,
        t.MEMBER_CASUAL,
        d.STATION_NAME,
        d.STATION_ID
from {{ref('Trips_Fact')}} as t
join
{{ref('StationDimension')}} as d
on 
t.RIDE_ID = d.RIDE_ID
where t.RIDE_ID != 'ride_id')
select * from cte 