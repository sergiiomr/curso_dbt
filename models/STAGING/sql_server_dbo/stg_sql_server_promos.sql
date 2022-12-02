{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'promos') }}
    ),

renamed_casted AS (
    SELECT
          promo_id
        , status as Estado
        , discount as Descuento
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted