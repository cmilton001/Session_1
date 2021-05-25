 SELECT first_name, last_name, job_title from customers where job_title='Owner'; 
 SELECT product_name, list_price from products where list_price>=50 ;
 SELECT product_name, list_price from products where list_price>=15 and list_price<=20 ;
 SELECT id, sum(shipping_fee) from orders GROUP BY id; 
 SELECT shipped_date, sum(shipping_fee) from orders where shipped_date='2006-04-05' GROUP BY shipped_date ;
 SELECT first_name, last_name, product_name from products a LEFT JOIN suppliers b on a.supplier_ids=b.id ;
 SELECT supplier_id, first_name, last_name, quantity from purchase_orders a LEFT JOIN suppliers b on a.supplier_id=b.id LEFT JOIN purchase_order_details c on a.id=c.purchase_order_id where quantity>=40 ;

