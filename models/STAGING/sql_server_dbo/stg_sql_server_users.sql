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
        , address_id as ID_Direccion
        , first_name as Nombre
        , created_at as Fecha_Creacion
        , total_orders as Total_Pedidos
        , last_name as Apellido
        , updated_at as Fecha_Modificacion
        , phone_number as Numero_telefono
        , email as Correo_Electronico
        , _fivetran_synced AS date_load
    FROM src_sql_server_dbo
    )

SELECT * FROM renamed_casted