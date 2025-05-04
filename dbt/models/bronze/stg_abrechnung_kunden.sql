{{ config(materialized='table') }}

SELECT * , case when kdnr = 'NULL' OR kdnr < 0 THEN 0 ELSE 1 END AS is_valid_kdnr
FROM {{ ref('abrechnung_kunden') }}