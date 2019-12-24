{{config(
  materialized= 'Ephemeral'
  , alias='dim_city_tmp'
  , tag='dim'
  , unique_key='city'
)}}

with cities_cte as (
  select 'New York' as city, date_add(current_date(), interval 1 day) as created_at
  union all
  select distinct address.city as city, date_add(current_date(), interval 1 day) as created_at
  from stitch_recurly.accounts
  where nullif(address.city, '') is not null
)
select * 
from cities_cte