{{ config(materialized='view') }}

SELECT
    *
FROM {{ ref('stg_abrechnung_kunden') }}
WHERE is_valid_kdnr = 1