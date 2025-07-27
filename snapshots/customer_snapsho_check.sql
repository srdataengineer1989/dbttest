{% snapshot  snap_customers_check %}

{{config(strategy='check',
unique_key='id',
check_cols = ['gender','UPDATE_AT','name'],
invalidate_hard_deletes=True
)
}}
select * 
from {{source('rawsource','raw_customers_snapshot')}}

{% endsnapshot %}