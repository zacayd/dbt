
{{config(materialized='incremental',unique_key='O_ORDERDATE')}}

select * from 
SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.ORDERS a
where O_ORDERDATE<=current_date

{% if is_incremental() %}
	and O_ORDERDATE>(select max(O_ORDERDATE) from  {{this}})
{% endif %}
