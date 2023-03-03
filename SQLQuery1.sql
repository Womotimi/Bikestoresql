SELECT
	ord.order_id,
	CONCAT (cus.first_name, ' ', cus.last_name) As 'customers',
	cus.city,
	cus.state,
	ord.order_date,
	sum(ite.quantity) As 'total units',
	sum(ite.quantity * ite.list_price) AS 'revenue',
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name) AS 'sales_rep',
	prb.brand_name
FROM Sales.orders ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
Join sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id =pro.product_id
join production.categories cat
on pro.category_id = cat.category_id
Join sales.stores sto
ON ord.store_id = sto.store_id
JOIN sales.staffs sta
ON ord.staff_id = sta.staff_id
join production.brands prb
on pro.brand_id =prb.brand_id
Group by
	ord.order_id,
	CONCAT (cus.first_name, ' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name),
	prb.brand_name