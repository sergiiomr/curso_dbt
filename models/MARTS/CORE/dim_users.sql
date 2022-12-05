{{
  config(
    materialized='table',
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
        , ID_Direccion
        , Nombre
        , Fecha_Creacion
        , Total_Pedidos
        , Apellido
        , Fecha_Modificacion
        , Numero_telefono
        , Correo_Electronico
        , date_load
    FROM dim_users
    )

select * from renamed_casted

