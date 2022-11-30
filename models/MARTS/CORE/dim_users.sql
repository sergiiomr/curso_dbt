{{
  config(
    materialized='incremental',
    unique_key = 'user_id'
  )
}}

WITH dim_users AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_users') }}
    ),

renamed_casted AS (
    SELECT
          user_id
        , address_id
        , Nombre
        , created_at
        , total_orders
        , Apellido
        , updated_at
        , TLF
        , email
        , date_load
    FROM dim_users
    )

select * from renamed_casted

{% if is_incremental() %}

  where created_at > (select max(created_at) from {{ this }})

{% endif %}