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
          event_id as ID_Evento
        , product_id as ID_Producto
        , page_url as URL
        , event_type as Tipo_Evento
        , order_id as ID_Pedido
        , session_id as ID_sesion
        , user_id as ID_Usuario
        , created_at as Creado
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted