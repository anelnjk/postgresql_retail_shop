//UPDATE_FOR_EACH_TABLE
update address set address_line = 'Zhambyl street' where postcode = 111109;

update staff set address_id = 
(select address_id from address 
where address_line = 'Zhanazhol street'and postcode = 010009)
where worker_id = 211;

update suppliers set sup_end_date = null where supplier_id=319;

update customers set last_purchase = last_purchase + 1 where customer_id=421;

update customer_orders set customer_amount = customer_amount+1 
where customer_amount>2 and customer_amount<5;

update supplier_orders set supplier_amount = 100 where item_id = 7;

update brands set brand_description = 'American fashion house established in 1968' 
where brand_id = 3;

update category set category_description = 'JACKETS, SWEATSHIRTS & HOODIES' 
where category_id = 2;

update sales set sale_percentage = 10 where sale_percentage < 10;

update inventory set item_price = (select min(item_price)
from inventory where brand_id = 5) where brand_id = 5;

//DELETE_FOR_EACH_TABLE
delete from customers where last_purchase = 
(select min(last_purchase) from customers);

delete from address where postcode >010014 and postcode <010016;

delete from staff where worker_firstname like 'John';

delete from suppliers where address_id >=130 and sup_end_date is not null;

delete from customer_orders where customer_id = 411 and customer_check >= 1013;

delete from category where category_id = 11;

delete from inventory where item_price = 
(select max(item_price) from inventory);

delete from brands where brand_description = 'Unknown new brand';

delete from supplier_orders
where supplier_amount = 
(select max(supplier_amount) from supplier_orders);

delete from sales where sale_percentage >= 50;