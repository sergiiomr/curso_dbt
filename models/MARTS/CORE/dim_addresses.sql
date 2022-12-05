{{
  config(
    materialized='table',
    unique_key = 'address_id'
  )
}}

WITH dim_addresses AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_addresses') }}
    ),

renamed_casted AS (
    SELECT
          address_id
        , Codigo_Postal
        , Ciudad
        , Direccion
        , Estado
        , date_load
    FROM dim_addresses
    )

SELECT * FROM renamed_casted