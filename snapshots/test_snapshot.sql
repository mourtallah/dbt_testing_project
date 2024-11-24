{% snapshot orders_snapshot %}
    {{
        config(
          unique_key='trip_id',
          strategy='timestamp',
          updated_at='start_time',
          target_schema='test_snapshot',
        )
    }}
    select * from {{ source('test_table_sources', 'bikeshare_trips') }}
    
{% endsnapshot %}