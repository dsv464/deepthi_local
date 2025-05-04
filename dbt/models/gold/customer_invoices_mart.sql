{{ config(materialized='view') }}

SELECT
k.Verlagsname as customer_entity_name,
k.kdnr as customer_entity_id,
r.renummer as invoice_id,
r.ReDatum as invoice_created_date,
r.Zahlungsdatum as payment_date,
r.days_between_invoice_payment,
r.payment_status,
p.is_placeholder,
SUM(p.Nettobetrag) AS invoice_total
FROM {{ ref('int_rechnungen') }} r
LEFT JOIN {{ ref('int_positionen') }} p ON r.ReNummer = p.ReId
LEFT JOIN {{ ref('int_kunden') }}  k ON r.KdNr = k.Kdnr
GROUP BY 1,2,3,4,5,6,7,8