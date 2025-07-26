{{config(materialized='table')}}
Select 
* 
from 
{{ source('rawsource', 'raw_customerdata') }}