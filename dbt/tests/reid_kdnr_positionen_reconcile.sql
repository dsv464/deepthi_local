select  * from {{ ref('stg_abrechnung_positionen') }} p
where (is_valid_KdNr = 1 AND is_valid_Reid = 1)
and
(not exists 
(select 1 FROM  {{ ref('stg_abrechnung_kunden') }} k where p.KdNr = k.KdNr ) 
or 
not exists 
(select 1 FROM  {{ ref('stg_abrechnung_rechnungen') }} r where p.Reid = r.ReNummer ) )
