{% snapshot orders_snapshot %}
    {{
        config(
          unique_key='id',
          strategy='timestamp',
          updated_at='timestamp',
          target_schema='test_snapshot',
        )
    }}
    select * from {{ source('test_table_sources', 'bikeshare_trips') }}
    
{% endsnapshot %}