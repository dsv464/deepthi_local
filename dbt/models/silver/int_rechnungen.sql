{{ config(materialized='view') }}

SELECT
    * 
    , days_between_invoice_payment
    ,case  
    when Zahlungsdatum = 'NULL' THEN 'not_paid'
    when days_between_invoice_payment > 7 then 'delayed_payment'
    else 'paid' end as payment_status
FROM {{ ref('stg_abrechnung_rechnungen') }}
WHERE is_valid_kdnr = 1 AND is_valid_reid = 1