SELECT  * FROM {{ ref('int_rechnungen') }} 
WHERE  
(ZahlungsbetragBrutto = 'NULL' OR SummeNetto = 'NULL' OR abs(ZahlungsbetragBrutto) < abs(SummeNetto))