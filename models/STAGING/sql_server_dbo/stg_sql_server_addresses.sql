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
          address_id
        , zipcode
        , country
        , address 
        , state
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted