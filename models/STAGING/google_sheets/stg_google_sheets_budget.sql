{{ config(
    materialized='incremental',
    unique_key = '_row'
    ) 
    }}


WITH stg_google_sheets_budget AS (
    SELECT * 
    FROM {{ source('src_google_sheets','budget') }}
    ),

renamed_casted AS (
    SELECT
          _row
        , month
        , quantity
        , _fivetran_synced
    FROM stg_google_sheets_budget
    )

SELECT * FROM renamed_casted

{% if is_incremental() %}

  where _fivetran_synced > (select max(_fivetran_synced) from {{ this }})

{% endif %}