create database supply_chain;
use supply_chain;

 -- TABLE 1
 CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR (100),
customer_country VARCHAR (100),
customer_segment VARCHAR (100),
customer_state VARCHAR (100)
);

LOAD DATA LOCAL INFILE "C:/Users/USER/Downloads/Portfolio/project 1/customers.csv"
INTO TABLE customers
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- TABLE 2

CREATE TABLE product(
product_id  INT PRIMARY KEY ,
product_name VARCHAR (100),
category_id VARCHAR (50) ,
category_name VARCHAR (100),
product_price VARCHAR (50) ,
department_id VARCHAR (50),
department_name VARCHAR (50)
);

LOAD DATA LOCAL INFILE "C:/Users/USER/Downloads/Portfolio/project 1/products.csv"
INTO TABLE product
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- TABLE 3

CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
order_country VARCHAR (50),
order_region VARCHAR (50),
order_status VARCHAR (50),
market VARCHAR (50),
transaction_type VARCHAR (50),
order_profit_per_order DECIMAL (10,2)
);

LOAD DATA LOCAL INFILE "C:/Users/USER/Downloads/Portfolio/supply_chain_project/orders.csv"
INTO TABLE orders
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- TABLE 4


CREATE TABLE order_item (
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
order_item_product_price DECIMAL (10,2),
order_item_quantity INT,
order_item_total DECIMAL (10,2),
sales DECIMAL (10,2),
order_item_discount DECIMAL (10,2)
);

LOAD DATA LOCAL INFILE "C:/Users/USER/Downloads/Portfolio/project 1/order_item.csv"
INTO TABLE order_item
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- TABLE 5

------
CREATE TABLE shipping (
shipping_id INT,
delivery_status VARCHAR (100),
order_id INT,
shipping_date DATE,
shipping_mode VARCHAR (50),
scheduled_shipping_date INT,
actual_shipping_date INT,
late_delivery_risk INT
);

LOAD DATA LOCAL INFILE "C:/Users/USER/Downloads/Portfolio/project 1/shipping.csv"
INTO TABLE shipping
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
