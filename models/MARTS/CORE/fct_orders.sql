{{
  config(
    materialized='table',
    unique_key = 'order_id',
  )
}}

WITH fct_orders AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_orders') }}
    ),

renamed_casted AS (
    SELECT
          order_id
        , Entregado
        , ID_seguimiento
        , Coste_Pedido
        , Empresa_de_Envio
        , Coste_Envio
        , Creado
        , Fecha_Estimada_Entrega
        , Pedido_Total
        , ID_Promo
        , ID_Usuario
        , ID_Direccion
        , Estado
        , date_load
    FROM fct_orders
    )

SELECT * FROM renamed_casted

