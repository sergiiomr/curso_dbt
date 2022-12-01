{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'addresses') }}
    ),

renamed_casted AS (
    SELECT
          address_id as ID_Direccion
        , zipcode as Codigo_Postal
        , country as Ciudad
        , address  as Direccion
        , state as Estado
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted