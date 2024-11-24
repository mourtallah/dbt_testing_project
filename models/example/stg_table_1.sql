{{ config(materialized='incremental') }}
SELECT *
FROM {{ source("test_table_sources", "bikeshare_trips") }}
{% if is_incremental() %}
WHERE {{ source("test_table_sources", "bikeshare_trips" ) }}.start_time > (SELECT MAX(start_time) from {{ this }})
{% endif %}
