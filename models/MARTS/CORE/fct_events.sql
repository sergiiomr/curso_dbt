{{
  config(
    materialized='table',
    unique_key = 'ID_Evento',
  )
}}

WITH fct_events AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_events') }}
    ),

renamed_casted AS (
    SELECT
          ID_Evento
        , ID_Producto
        , URL
        , Tipo_Evento
        , ID_Pedido
        , ID_sesion
        , ID_Usuario
        , Creado
        , date_load
    FROM fct_events
    )

SELECT * FROM renamed_casted

