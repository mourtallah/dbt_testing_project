{{ config(materialized='incremental') }}
SELECT *
FROM {{ ref("stg_stations") }}
{% if is_incremental() %}
WHERE modified_date > (SELECT MAX(modified_date) FROM {{ this }})
{% endif %}