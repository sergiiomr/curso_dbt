{{
  config(
    materialized='incremental',
    unique_key = 'order_id',
  )
}}

WITH fct_orders AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_orders') }}
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
        , date_load
    FROM fct_orders
    )

SELECT * FROM renamed_casted

{% if is_incremental() %}

  where created_at > (select max(created_at) from {{ this }})

{% endif %}