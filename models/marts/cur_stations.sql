{{ config(materialized='incremental') }}
SELECT *
FROM {{ ref("stg_stations") }}
{% if is_incremental() %}
WHERE {{ ref("stg_stations") }}.start_time > (SELECT MAX(start_time) FROM {{ this }})
{% endif %}