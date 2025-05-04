{{ config(materialized='table') }}

SELECT *
    , CASE WHEN Zahlungsdatum != 'NULL' THEN julianday(Zahlungsdatum) - julianday(ReDatum) END AS days_between_invoice_payment
    , CASE WHEN kdnr = 'NULL' OR kdnr < 0 THEN 0 ELSE 1 END AS is_valid_kdnr
    , CASE WHEN Reid = 'NULL' OR Reid < 0 THEN 0 ELSE 1 END AS is_valid_Reid
FROM {{ ref('abrechnung_rechnungen') }}