{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'users') }}
    ),

renamed_casted AS (
    SELECT
          user_id
        , address_id
        , first_name as Nombre
        , created_at
        , total_orders
        , last_name as Apellido
        , updated_at
        , phone_number as TLF
        , email
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted