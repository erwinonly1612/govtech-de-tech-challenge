--I want to know the list of our customers and their spending.
SELECT c.customer_id, c.customer_name, SUM(st.sales_value) as sales_value, SUM(st.sales_qty) as sales_qty
FROM Sales_Transaction st JOIN Customer c ON st.customer_id = c.customer_id
GROUP BY 1,2
ORDER BY 3 DESC, 2 DESC;

--I want to find out the top 3 car manufacturers that customers bought by sales (quantity) and the sales number for it in the current month.
SELECT m.manufacturer_id, m.manufacturer_name, SUM(st.sales_value) as sales_value, SUM(st.sales_qty) as sales_qty
FROM Sales_Transaction st 
JOIN Car c 
ON st.serial_number = c.serial_number
JOIN Manufacturer m
ON c.manufacturer_id = m.manufacturer_id
GROUP BY 1
ORDER BY 3 DESC, 2 DESC;