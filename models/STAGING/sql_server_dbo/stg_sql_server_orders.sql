{{
  config(
    materialized='table'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'orders') }}
    ),

renamed_casted AS (
    SELECT
          order_id
        , delivered_at
        , tracking_id
        , order_cost
        , shipping_service
        , shipping_cost
        , created_at
        , estimated_delivery_at
        , order_total
        , promo_id
        , user_id
        , address_id
        , status
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted