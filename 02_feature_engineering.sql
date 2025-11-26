ALTER TABLE shipments
ADD COLUMN lead_time INT,
ADD COLUMN delay_flag VARCHAR(20);

UPDATE shipments
SET lead_time = DATEDIFF(delivery_date, ship_date);

UPDATE shipments
SET delay_flag = CASE 
	WHEN lead_time > expected_lead_time THEN 'Delayed'
    ELSE 'On Time'
    END;

ALTER TABLE inventory
ADD COLUMN inventory_days DECIMAL(10,2),
ADD COLUMN excess_flag VARCHAR(20);

UPDATE inventory
SET inventory_days = stock_on_hand/nullif(avg_daily_sales,0);

UPDATE inventory
SET excess_flag = CASE
	WHEN stock_on_hand > safety_stock * 1.3 THEN 'Excess'
    ELSE 'Normal'
    END;