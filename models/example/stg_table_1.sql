
{{ config(materialized='incremental') }}
SELECT *
FROM {{ source("test_table_sources", "table1") }}
{% if is_incremental() %}
WHERE {{ source("test_table_sources", "table1" ) }}.timestamp > (SELECT MAX(timestamp) from {{ this }})
{% endif %}
