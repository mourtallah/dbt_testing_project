{{ config(materialized='view') }}
SELECT *
FROM {{ source("test_table_sources", "bikeshare_trips") }}
