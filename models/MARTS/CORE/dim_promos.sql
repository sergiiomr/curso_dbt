{{
  config(
    materialized='incremental',
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
        , status
        , discount
        , date_load
    FROM dim_promos
    )

select * from renamed_casted

{% if is_incremental() %}

  where date_load > (select max(date_load) from {{ this }})

{% endif %}