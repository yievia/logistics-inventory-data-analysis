/*Rank worst delayed orders*/
SELECT
    order_id,
    sku,
    region,
    lead_time,
    expected_lead_time,
    delay_flag,
    ROW_NUMBER() OVER (ORDER BY lead_time - expected_lead_time DESC) AS delay_rank
FROM shipments
WHERE delay_flag = 'Delayed'
ORDER BY delay_rank
LIMIT 10;

/*Moving average of inventory_days per store*/
SELECT
    store,
    date,
    inventory_days,
    ROUND(
        AVG(inventory_days) OVER (
            PARTITION BY store
            ORDER BY date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 1
    ) AS moving_avg_inventory_days_7d
FROM inventory
ORDER BY store, date;
