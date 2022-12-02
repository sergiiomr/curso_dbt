{{
  config(
    materialized='table',
    unique_key = 'promo_id'
  )
}}

WITH dim_promos AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_promos') }}
    ),

renamed_casted AS (
    SELECT
          promo_id
        , Estado
        , Descuento
        , date_load
    FROM dim_promos
    )

select * from renamed_casted

