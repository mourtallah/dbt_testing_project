{{ config(materialized='incremental') }}
SELECT *
FROM {{ source("test_table_sources", "table2" ) }}
{% if is_incremental() %}
WHERE {{ source("test_table_sources", "table2" ) }}.timestamp > (SELECT MAX(timestamp) FROM {{ this }})
{% endif %}