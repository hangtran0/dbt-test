
    merge into `bi-edw`.`stitch_recurly`.`DimCity` as DBT_INTERNAL_DEST
    using (
         

with cities_cte as (
  select 'New York' as city, date_add(current_date(), interval 1 day) as created_at
  union all
  select distinct address.city as city, date_add(current_date(), interval 1 day) as created_at
  from stitch_recurly.accounts
  where nullif(address.city, '') is not null
)
select * 
from cities_cte
       ) as DBT_INTERNAL_SOURCE

    
        on DBT_INTERNAL_SOURCE.city = DBT_INTERNAL_DEST.city
    

    
    when matched then update set
        `city` = DBT_INTERNAL_SOURCE.`city`,`created_at` = DBT_INTERNAL_SOURCE.`created_at`
    

    when not matched then insert
        (`city`, `created_at`)
    values
        (`city`, `created_at`)

  