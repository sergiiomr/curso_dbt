{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'events') }}
    ),

renamed_casted AS (
    SELECT
          event_id
        , product_id
        , page_url
        , event_type 
        , order_id
        , session_id
        , user_id
        , created_at
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted