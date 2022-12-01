{{
  config(
    materialized='incremental',
    unique_key = 'event_id',
  )
}}

WITH fct_events AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_events') }}
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
        , date_load
    FROM fct_events
    )

SELECT * FROM renamed_casted

{% if is_incremental() %}

  where created_at > (select max(created_at) from {{ this }})

{% endif %}