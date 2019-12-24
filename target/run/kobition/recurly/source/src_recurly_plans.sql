create or replace table `bi-edw`.`stitch_recurly`.`src_recurly_plans`
  
  
  OPTIONS()
  as (
    

select  * 
from (
  select 'NULL' as city
  union all
  select distinct address.city as city
  from stitch_recurly.accounts
  where nullif(address.city, '') is not null
) a
order by city desc
  );

    