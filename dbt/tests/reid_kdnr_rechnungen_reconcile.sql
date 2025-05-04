select  * from {{ ref('stg_abrechnung_rechnungen') }} k 
where (is_valid_KdNr = 1 AND is_valid_Reid = 1)
and
not exists 
(select 1 FROM  {{ ref('stg_abrechnung_kunden') }} r where r.KdNr = k.KdNr )