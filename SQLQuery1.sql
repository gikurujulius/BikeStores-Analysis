SELECT ord.order_id,
	CONCAT(cust.first_name, ' ', cust.last_name) AS full_name,
	cust.city,
	cust.state,
	ord.order_date,
	SUM(items.quantity) AS sales_volume,
	SUM(items.quantity * items.list_price) AS total_revenue,
	pro.product_name,
	cat.category_name,
	brand.brand_name,
	sto.store_name,
	CONCAT(rep.first_name, ' ', rep.last_name) AS sales_rep_name
FROM sales.orders ord
JOIN sales.customers cust
ON ord.customer_id = cust.customer_id
JOIN sales.order_items items
ON items.order_id = ord.order_id
JOIN production.products pro
ON pro.product_id = items.product_id
JOIN production.categories cat
ON cat.category_id = pro.category_id
JOIN production.brands brand
ON brand.brand_id = pro.brand_id
JOIN sales.stores sto
ON sto.store_id = ord.store_id
JOIN sales.staffs rep
ON rep.staff_id = ord.staff_id
GROUP BY ord.order_id,
	CONCAT(cust.first_name, ' ', cust.last_name),
	cust.city,
	cust.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	brand.brand_name,
	sto.store_name,
	CONCAT(rep.first_name, ' ', rep.last_name);