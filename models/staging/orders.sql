{{ config(materialized='table') }}

with cte_cust as (
    select * from {{source('rawsource', 'raw_customerdata') }}
)
Select o.*,cust.name
from {{ source('rawsource', 'raw_orders') }} o
inner join {{ ref('customers_ephemeral') }} cust on o.user_id=cust.id
inner join cte_cust custmer on o.user_id=custmer.id