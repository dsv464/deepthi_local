SELECT  * FROM {{ ref('int_positionen') }} 
WHERE is_placeholder = 0 AND 
(Nettobetrag <= 0 OR Nettobetrag = 'NULL'
OR Verdatum = 'NULL')
