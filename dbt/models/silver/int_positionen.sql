{{ config(materialized='view') }}

SELECT
    *
FROM {{ ref('stg_abrechnung_positionen') }}
WHERE is_valid_kdnr = 1 AND is_valid_reid = 1