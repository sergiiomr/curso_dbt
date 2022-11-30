{{
  config(
    materialized='incremental',
    unique_key = 'product_id'
  )
}}

WITH dim_products AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_products', ) }}
    ),

renamed_casted AS (
    SELECT
          product_id
        , price
        , INVENTORY
        , name
        , _fivetran_synced AS date_load
    FROM dim_promos
    )

SELECT * FROM renamed_casted

{% if is_incremental() %}

  where date_load > (select max(date_load) from {{ this }})

{% endif %}