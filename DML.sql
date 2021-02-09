use thenewshoestore;

-- Lista antalet produkter per kategori. Listningen ska innehålla kategori-namn och antalet produkter.


select category as Kategori, count(*) as Antal
from shoes, categories
where shoecategory = categories.id
group by shoecategory;


-- Vilka kunder har köpt svarta sandaler i storlek 38 av märket Ecco? Lista deras namn.

SELECT kundNamn, kundEfternamn
FROM kunder
JOIN product_order ON kunder.kundId=product_order.kundId
JOIN shoes ON product_order.shoeId=shoes.id 
AND shoes.brand='Ecco' AND shoes.size=38 AND shoes.color='Black';


-- Skapa en kundlista med den totala summan pengar som varje kund har handlat för. Kundens för- och efternamn, samt det totala värdet som varje person har shoppats för, skall visas.

SELECT k.kundNamn as Förnamn, k.kundEfternamn as Efternamn, SUM(price) as Summa
from kunder k
JOIN product_order o ON o.kundId=k.kundId
join shoes s on o.shoeId = s.id
group by kundNamn;



/*
 select k.kundOrt as Ort , SUM(price) as Summa
 from kunder k
 JOIN product_order o ON o.kundId=k.kundId
 join shoes s on o.shoeId = s.id
 group by kundOrt
 */


select k.kundOrt as Ort , SUM(price) as Summa
from kunder k
join product_order o on o.kundId=k.kundId
join shoes s on o.shoeId = s.id
group by kundOrt
having SUM(price > 1000);


-- Skapa en topp-5 lista av de mest sålda produkterna.

select s.id as Produkt , count(*)as Antal_Sålda
from shoes s
join product_order o on o.shoeId=s.id
group by s.id
order by Antal_Sålda desc