use thenewshoestore;

-- Lista antalet produkter per kategori. Listningen ska innehålla kategori-namn och antalet produkter.

select categories.category as Kategori, count(belongsTo.categoryId) as Antal 
from categories
left join belongsTo on categoryId = categories.id
group by categories.category;


-- Vilka kunder har köpt svarta sandaler i storlek 38 av märket Ecco? Lista deras namn.

select kundNamn as Förnamn, kundEfternamn as Efternamn
from kunder
inner join product_order on product_order.kundId = kunder.kundId
inner join orderInfo on orderInfo.orderId = product_order.id
inner join shoes on shoes.id = orderInfo.shoeId
where orderInfo.shoeId = 3 and shoes.color = 'Black' and shoes.size = 38;


-- Skapa en kundlista med den totala summan pengar som varje kund har handlat för. Kundens för- och efternamn, samt det totala värdet som varje person har shoppats för, skall visas.

select kunder.kundNamn as Förnamn, kunder.kundEfternamn as Efternamn, sum(shoes.price) as Summa
from kunder
inner join product_order on product_order.kundId = kunder.kundId
inner join orderInfo on orderInfo.orderId = product_order.id
inner join shoes on orderInfo.shoeId = shoes.id
group by kunder.kundId
order by Summa desc;


-- Skriv ut en lista på det totala beställningsvärdet per ort där beställningsvärdet är större än1000 kr.
-- Ortnamn och värde ska visas. (det måste finnas orter i databasen där det har
-- handlats för mindre än 1000 kr för att visa att frågan är korrekt formulerad)


select kunder.kundOrt as Ort, sum(shoes.price) as Summa
from kunder
inner join product_order on kunder.kundId = product_order.kundId
inner join orderInfo on orderInfo.orderId = product_order.id
inner join shoes on orderInfo.shoeId = shoes.id
group by kunder.kundOrt
having Summa > 1000
order by Summa desc;


-- Skapa en topp-5 lista av de mest sålda produkterna.


select shoes.id as Produkt_Id, count(shoes.id) as Sålda
from orderInfo
inner join shoes on orderInfo.shoeId = shoes.id
group by shoes.id
order by Sålda desc
limit 5;


-- Vilken månad hade du den största försäljningen? (det måste finnas data som anger
-- försäljning för mer än en månad i databasen för att visa att frågan är korrekt formulerad)


select month(product_order.date_of_order) as Månad, sum(shoes.price) as Summa
from product_order
inner join orderInfo on orderInfo.orderId = product_order.id 
inner join shoes on orderInfo.shoeId = shoes.id
group by Månad
order by Summa desc
limit 1;