{{config(
  materialized= 'incremental'
  , alias='dim_city'
  , tag='dim'
  , unique_key='city'
)}}

select *
from {{ref('dim_city copy')}}