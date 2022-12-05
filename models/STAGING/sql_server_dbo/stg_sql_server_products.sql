{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'products') }}
    ),

renamed_casted AS (
    SELECT
          product_id
        , price as Precio
        , INVENTORY as Inventario
        , name as Nombre
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted