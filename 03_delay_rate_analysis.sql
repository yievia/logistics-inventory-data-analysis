/*Shipment delay rate by month*/
SELECT 
	DATE_FORMAT(ship_date, '%Y-%m') AS month,
    COUNT(*) AS total_shipments,
	SUM(delay_flag='Delayed') AS delayed_shipments,
    ROUND((SUM(delay_flag='Delayed')/COUNT(*))*100, 2) AS delay_rate_pct
FROM shipments
GROUP BY month
ORDER BY month;

/*Delay rate by region & shipping mode*/
SELECT region, shipping_mode, 
	COUNT(*) AS total_shipments,
	SUM(delay_flag='Delayed') AS delayed_shipments,
    ROUND((SUM(delay_flag='Delayed')/COUNT(*))*100, 2) AS delay_rate_pct
FROM shipments
GROUP BY region, shipping_mode
ORDER BY delay_rate_pct DESC;
