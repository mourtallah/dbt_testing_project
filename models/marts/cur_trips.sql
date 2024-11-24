{{ config(materialized='incremental') }}
SELECT *
FROM {{ ref("stg_trips") }}
{% if is_incremental() %}
WHERE start_time > (SELECT MAX(start_time) from {{ this }})
{% endif %}
