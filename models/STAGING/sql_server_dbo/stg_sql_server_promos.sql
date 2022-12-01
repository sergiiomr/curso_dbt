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
          promo_id as ID_Promo
        , status as Estado
        , discount as Desuento
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted