{{
  config(
    materialized='incremental',
    unique_key = 'address_id'
  )
}}

WITH dim_addresses AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_addresses', ) }}
    ),

renamed_casted AS (
    SELECT
          address_id
        , zipcode
        , country
        , address
        , state
        , _fivetran_synced AS date_load
    FROM dim_addresses
    )

SELECT * FROM renamed_casted

{% if is_incremental() %}

  where date_load > (select max(date_load) from {{ this }})

{% endif %}