{{
  config(
    materialized='view'
  )
}}

WITH src_sql_server_dbo AS (
    SELECT * 
    FROM {{ source('src_sql_server_dbo', 'orders') }}
    ),

renamed_casted AS (
    SELECT
          order_id as ID_Pedido
        , delivered_at AS Entregado
        , tracking_id as ID_seguimiento
        , order_cost as Coste_Pedido
        , shipping_service as Empresa_de_Envio
        , shipping_cost as Coste_Envio
        , created_at AS Creado
        , estimated_delivery_at Fecha_Estimada_Entrega
        , order_total as Pedido_Total
        , promo_id as ID_Promo
        , user_id as ID_Usuario
        , address_id as ID_Direccion
        , status AS Estado
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted