{{
  config(
    materialized='view'
  )
}}

WITH dim_order_items AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_order_item') }}
    ),

renamed_casted AS (
    SELECT
          order_id
        , product_id
        , quantity
        , _fivetran_synced AS date_load
    FROM dim_order_items
    )

SELECT * FROM renamed_casted