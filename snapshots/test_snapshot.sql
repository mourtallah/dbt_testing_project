{% snapshot orders_snapshot %}
    {{
        config(
          unique_key='id',
          strategy='timestamp',
          updated_at='timestamp',
          target_schema='test_snapshot',
        )
    }}
    -- Pro-Tip: Use sources in snapshots!
    -- select * from {{ source('test_table_sources', 'table1') }}
    select * from {{ ref('stg_table_1') }}
{% endsnapshot %}