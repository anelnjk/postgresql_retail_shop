//QUERIES
select customer_orders.item_id,customer_orders.customer_amount,
inventory.item_description
from customer_orders
inner join inventory
on customer_orders.item_id=inventory.item_id
where customer_check = 1009;

select to_char(avg(item_price), '9999999.9') as avg_price from inventory;

select distinct(city) from address
where region like 'North%';

select distinct(customer_check), customers.customer_firstname, customers.customer_surname
from customer_orders
inner join customers
on customers.customer_id=customer_orders.customer_id
where customer_surname between 'McCall' and 'Tate'
order by customer_firstname;

select supplier_firstname, supplier_surname, address.city,
address.address_line, address.postcode
from suppliers
left join address
on suppliers.address_id=address.address_id;

select item_description, sales.sale_percentage
from inventory
left join sales
on inventory.sale_id=sales.sale_id;

select distinct(customer_check), customers.customer_firstname,
customers.customer_surname
from customer_orders
right join customers
on customer_orders.customer_id=customers.customer_id
order by customer_check;

select distinct(city), region from address
order by region;

select customers.customer_id, inventory.item_id, 
inventory.item_description, sales.sale_percentage
from customers
inner join customer_orders on customers.customer_id=customer_orders.customer_id
inner join inventory on customer_orders.item_id=inventory.item_id
inner join sales on inventory.sale_id=sales.sale_id
order by customer_id;

select brand_name, brand_description,length(brand_description) as symbols
from brands where brand_description is not null;

//SUBQUERIES
select stock_date, item_description 
from inventory where stock_date=
(select max(stock_date) from inventory);

select * from customers
where customer_surname in 
(select customer_surname from customers
group by customer_surname 
having count(customer_surname)>1);

select brand_name, suppliers.supplier_id,suppliers.supplier_firstname, suppliers.supplier_surname
from brands
inner join inventory
on brands.brand_id=inventory.brand_id
inner join supplier_orders
on inventory.item_id=supplier_orders.item_id
inner join suppliers
on suppliers.supplier_id=supplier_orders.supplier_id
where supplier_firstname in(
select supplier_firstname
from suppliers where sup_end_date is not null);

select * from customers
where address_id in
(select address_id from address 
where region like 'East%');
 
select item_description, item_price as initial_price, sales.sale_percentage,
cast((item_price-((item_price*sales.sale_percentage)/100)) as int) as final_price
from inventory
inner join sales
on inventory.sale_id = sales.sale_id
where item_id in
(select item_id from inventory
where sale_id is not null);

select customer_firstname, customer_surname, 
(select count(cust_order_id)
from customer_orders
where customer_orders.customer_id = customers.customer_id) as order_count
from customers
order by order_count desc;

select * from inventory
where item_price > (select avg(item_price) from inventory)
order by item_price desc;

select * from inventory
where item_id not in (select item_id from supplier_orders)
order by item_id asc;

select customer_id from customers
where customer_id in (select customer_orders.customer_id from customer_orders
inner join inventory
on customer_orders.item_id = inventory.item_id
where inventory.item_price > (select avg(item_price) from inventory));

select sup_order_id, supplier_id, 
(select inventory.item_price * supplier_amount) as total_sum
from supplier_orders
inner join inventory
on supplier_orders.item_id = inventory.item_id;
