{{
  config(
    materialized='table',
    unique_key = 'order_id'
  )
}}

WITH dim_order_items AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_order_items') }}
    ),

renamed_casted AS (
    SELECT
          order_id
        , ID_Producto
        , Cantidad
        , date_load
    FROM dim_order_items
    )

SELECT * FROM renamed_casted

