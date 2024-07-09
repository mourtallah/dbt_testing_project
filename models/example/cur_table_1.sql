-- FILEPATH: /Users/bigboss/Projects/DBT_ex/dbt_testing_project/models/example/cur_table_1.sql
SELECT t1.id, name, age, address, phone, t1."timestamp" AS t1_ts, t2."timestamp" AS t2_ts
FROM {{ ref("stg_table_1") }} AS t1
LEFT JOIN {{ ref("stg_table_2") }} AS t2 ON t1.id = t2.id
