{{config(materialized='ephemeral')}}


select *
from {{ source('rawsource','raw_customerdata') }}