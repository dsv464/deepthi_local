{{ config(materialized='table') }}

SELECT *
, CASE WHEN Bildnummer = 100000000 THEN 1 ELSE 0 END AS is_placeholder
, CASE WHEN kdnr = 'NULL' OR kdnr < 0 THEN 0 ELSE 1 END AS is_valid_kdnr
, CASE WHEN Reid = 'NULL' OR Reid < 0 THEN 0 ELSE 1 END AS is_valid_Reid
FROM {{ ref('abrechnung_positionen') }}