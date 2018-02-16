-- 1.	Get all customers and their addresses.
SELECT customers.first_name, customers.last_name, 
addresses.street, addresses.city, addresses.state, 
addresses.zip FROM customers
JOIN addresses on customer_id = customers.id; 

--	2.	Get all orders and their line items.
SELECT * FROM orders
JOIN line_items on orders.id = order_id;

--	3.	Which warehouses have cheetos?
SELECT warehouse.warehouse FROM warehouse_product
JOIN warehouse on warehouse_id = warehouse.id
JOIN products on product_id = products.id
WHERE products.id = 5;

--	4.	Which warehouses have diet pepsi?
SELECT warehouse.warehouse FROM warehouse_product
JOIN warehouse on warehouse_id = warehouse.id
JOIN products on product_id = products.id
WHERE products.id = 6;


--	5.	Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.id, customers.first_name,
customers.last_name, COUNT(orders.id) FROM addresses
JOIN customers on customer_id = customers.id
JOIN orders on address_id = addresses.id
GROUP BY customers.id; 

--	6.	How many customers do we have?
SELECT COUNT(customers.id) FROM customers; 

--	7.	How many products do we carry?
SELECT COUNT(products.id) FROM products;

--	8.	What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand) FROM warehouse_product
JOIN products on product_id = products.id
WHERE product_id = 6; 
