{{ config(materialized='incremental') }}
SELECT *
FROM {{ source("test_table_sources", "bikeshare_stations" ) }}
{% if is_incremental() %}
WHERE {{ source("test_table_sources", "bikeshare_stations" ) }}.timestamp > (SELECT MAX(timestamp) FROM {{ this }})
{% endif %}