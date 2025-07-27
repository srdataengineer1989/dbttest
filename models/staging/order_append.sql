{{ config(materialized='incremental',
incremental_strategy="append",  )
 }}
Select o.*,cust.name
from {{ source('rawsource', 'raw_orders') }} o
inner join {{ ref('customers_ephemeral') }} cust on o.user_id=cust.id 
