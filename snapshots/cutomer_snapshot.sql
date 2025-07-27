{% snapshot  snap_customers_timestamp %}

{{config(strategy='timestamp',
unique_key='id',
updated_at='update_at',
invalidate_hard_deletes=True
)
}}
select * 
from {{source('rawsource','raw_customers_snapshot')}}

{% endsnapshot %}