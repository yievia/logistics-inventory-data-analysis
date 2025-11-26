CREATE DATABASE logistics_inventory_analysis;
USE logistics_inventory_analysis;

CREATE TABLE shipments (
    order_id INT PRIMARY KEY,
    sku VARCHAR(20),
    region VARCHAR(50),
    ship_date DATE,
    delivery_date DATE,
    expected_lead_time INT,
    shipping_mode VARCHAR(20)
);

CREATE TABLE inventory (
	sku VARCHAR(20),
    stock_on_hand INT,
    avg_daily_sales DECIMAL(10,2),
    safety_stock INT,
    store VARCHAR(50),
    date DATE
    );

CREATE TABLE sku_master(
	sku VARCHAR(20) PRIMARY KEY,
	category VARCHAR(50),
    product_name VARCHAR(100)
    );
	