{% snapshot snp_salesforce_opportunity %}

{{
    config(
      target_database='pc_fivetran_db',
      target_schema='dbt_caseydunlap',
      unique_key='id',
      strategy='timestamp',
      updated_at='last_modified_date',
    )
}}

select * 
, current_timestamp() as dbt_snapshot_at
from {{source('salesforce','opportunity')}}

{% endsnapshot %}