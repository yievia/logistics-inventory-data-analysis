SELECT 
    s.order_id,
    s.sku,
    m.category,
    m.product_name,
    s.region,
    s.lead_time,
    s.delay_flag
FROM shipments AS s
LEFT JOIN sku_master AS m
ON s.sku = m.sku;

SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    store,
    SUM(stock_on_hand) AS total_stock,
    ROUND(AVG(inventory_days), 1) AS avg_inventory_days,
    SUM(excess_flag = 'Excess') AS excess_sku_count
FROM inventory
GROUP BY month, store
ORDER BY month, store;

