{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'order_items') }}
    ),

renamed_casted AS (
    SELECT
          order_id as ID_Pedido
        , product_id as ID_Producto
        , quantity
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted