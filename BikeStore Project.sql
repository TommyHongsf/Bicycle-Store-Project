Select
	ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name) As 'customer_name',
	cus.city,
	cus.state,
    ord.order_date,
	Year(ord.order_date) As year,
	SUM(ite.quantity) As 'total_units',
	SUM(ite.quantity*ite.list_price) As 'revenue',
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name) As 'sales rep',
	brand_name
From BikeStores.sales.orders ord
Join BikeStores.sales.customers cus
	On ord.customer_id = cus.customer_id
Join BikeStores.sales.order_items ite
	On ord.order_id = ite.order_id
Join BikeStores.production.products pro
	On ite.product_id = pro.product_id
Join BikeStores.production.categories cat
	On pro.category_id = cat.category_id
Join BikeStores.sales.stores sto
	On ord.store_id = sto.store_id
Join BikeStores.sales.staffs sta
	On ord.staff_id = sta.staff_id
Join BikeStores.production.brands bra
	On pro.brand_id = bra.brand_id
Group By
	ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name),
	cus.city,
	cus.state,
    ord.order_date,
	Year(ord.order_date),
	--SUBSTRING(ord.order_date, 1, CHARINDEX('-', ord.order_date)-1),
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name),
	brand_name