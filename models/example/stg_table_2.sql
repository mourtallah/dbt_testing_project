{{ config(materialized='incremental') }}
SELECT *
FROM {{ source("test_table_sources", "bikeshare_stations" ) }}
{% if is_incremental() %}
WHERE {{ source("test_table_sources", "bikeshare_stations" ) }}.start_time > (SELECT MAX(start_time) FROM {{ this }})
{% endif %}