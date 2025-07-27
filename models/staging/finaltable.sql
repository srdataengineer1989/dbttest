{{ config(materialized='table', transient='false') }}

select
    cust.id as customerid,
    cust.name as customername,
    max(ord.order_date) as last_order_date,
    min(ord.order_date) as first_order_date,
    count(1) as totalorders
from {{ ref("orders") }} ord
inner join {{ ref("customer") }} cust on ord.user_id = cust.id
group by cust.id, cust.name
