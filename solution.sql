SELECT 
    o.cust_id AS id,
    c.first_name,
    SUM(o.total_order_cost)
FROM orders o
JOIN customers c 
    ON c.id = o.cust_id
GROUP BY o.cust_id;
