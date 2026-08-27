# Supply Chain Sales & Operational Performance Analysis

## 📊 Project Overview

This project analyzes supply chain performance to uncover insights across **sales, customers, products, profitability, and logistics operations**.

The project follows an end-to-end data analytics workflow, starting with data cleaning and preparation in Microsoft Excel, followed by SQL-based business analysis in MySQL and interactive dashboard development in Power BI.

The objective was to transform raw supply chain data into actionable insights that could support better business and operational decision-making.

---

## 🎯 Business Problem

The company needs a clear, data-driven view of its sales performance, customer behavior, product profitability, and delivery operations.

This analysis evaluates key performance indicators, identifies trends and performance gaps, and highlights areas where management could improve revenue, profitability, customer performance, and logistics efficiency.

---

## 🛠️ Tools & Technologies

| Tool              | Purpose                                       |
| ----------------- | --------------------------------------------- |
| Microsoft Excel | Intermediate–Advanced — data cleaning, duplicate removal, data transformation, text functions, and data preparation         |
|  MySQL          | Intermediate — database/table creation, data validation, filtering, aggregation, joins, subqueries, CTEs, CASE statements, window functions, LAG(), and business-focused analysis |
|  Power BI       | Intermediate — data modeling, relationships, interactive dashboards, KPI cards, charts, filters/slicers, formatting, and business storytelling |
|  DAX             |Intermediate — calculated measures, CALCULATE(), DIVIDE(), time-intelligence calculations, YoY analysis, KPI development, and performance metrics |

---

## 🔄 Analytics Workflow

**Raw Data → Excel Data Cleaning → MySQL Database → SQL Business Analysis → Power BI Data Model → DAX KPIs → Interactive Dashboards → Business Insights**

---

## 📌 Key Business Areas

The analysis was organized into four major business functions:

### 1. Executive Management

Evaluated overall business performance through:

- Total Sales
- Total Profit
- Total Orders
- Average Order Value
- Profit Margin
- Sales trends
- Profit trends
- Market performance

### 2. Sales & Customer Performance

Analyzed:

- Customer base
- Customer segments
- Average Order Value
- Repeat customers
- Repeat customer sales
- Top customers by sales
- Top customers by profit
- Customer performance over time

### 3. Product Management

Evaluated:

- Product sales
- Quantity sold
- Product profitability
- Profit margins
- Product categories
- Best-performing products
- Revenue versus sales volume

### 4. Supply Chain & Logistics

Analyzed:

- Total orders
- Late deliveries
- Late-delivery rate
- Shipping-mode performance
- Late deliveries by market
- Delivery performance over time
- Actual versus scheduled delivery time

---

## 📊 Power BI Dashboards

The project contains four interactive Power BI dashboards.

### Executive Overview

Provides a high-level view of the company's overall financial and sales performance.

**Key metrics include:**

- **$36.8M** Total Sales
- **$1.39M** Total Profit
- **66K** Total Orders
- **$559.4** Average Order Value
- **3.78%** Profit Margin
- **54.82%** Late Delivery Rate

### Sales & Customer Performance

Examines customer behavior, customer segments, repeat purchasing, average order value, and top customer performance.

### Product Management Performance

Evaluates product sales, quantity sold, profitability, product categories, and the relationship between sales volume and revenue.

### Supply Chain & Logistics Performance

Evaluates shipping and delivery performance, including late deliveries, shipping modes, markets, and actual versus scheduled delivery times.

---

## 🔍 Key Business Insights

### 1. Profitability remains relatively low

The business generated approximately **$36.8M in sales** but only **$1.39M in profit**, resulting in a **3.78% profit margin**.

This indicates an opportunity to improve product margins, pricing, discounts, and operational efficiency.

### 2. Delivery performance is a major operational concern

Approximately **54.82% of orders were classified as late deliveries**.

This highlights a significant logistics performance issue that could affect customer satisfaction and operational efficiency.

### 3. Sales and profit performance vary across markets

Market-level analysis shows differences in revenue and profitability, allowing management to identify stronger markets and investigate weaker-performing ones.

### 4. Customer value is concentrated among high-value customers

Analysis of repeat customers and top customers provides insight into the customers contributing significantly to overall revenue and profit.

### 5. High sales volume does not always mean the highest revenue

Product analysis shows that the products with the highest quantity sold are not necessarily the products generating the highest sales revenue.

This highlights the importance of evaluating both **volume and monetary value** when making product decisions.

---

## 💡 Business Recommendations

Based on the analysis, management could:

1. **Investigate late-delivery drivers** by shipping mode, market, and region.
2. **Review logistics processes** where actual delivery times consistently exceed scheduled times.
3. **Focus on improving profit margins** through pricing, discount, product mix, and cost management.
4. **Develop customer retention strategies** for high-value and repeat customers.
5. **Evaluate product performance using both sales volume and revenue** rather than relying on quantity sold alone.
6. **Prioritize high-performing markets** while investigating underperforming markets for improvement opportunities.

---

## 📁 Repository Structure

```text
supply-chain-performance-analysis/
│
├── SQL/
│   ├── 01_Create_Table.sql
│   ├── 02_Executive_Overview.sql
│   ├── 03_Sales_Customer_Analysis.sql
│   ├── 04_Product_Analysis.sql
│   └── 05_Supply_Chain_Logistics_Analysis.sql
│
├── Dashboard screenshots/
│   ├── 01_Executive_Overview.png
│   ├── 02_Sales_Customer_Performance.png
│   ├── 03_Product_Management_Performance.png
│   └── 04_Supply_Chain_Logistics_Performance.png
│
├── PowerBI/
│   └── Supply_Chain_Analysis_Dashboard.pbix
│
├── Documentation/
│   ├── Project_Documentation.md
│   └── SQL_Analysis_Guide.md
│
└── README.md
```

---

## 📚 SQL Analysis

The SQL scripts contain business-focused analysis covering:

- Executive performance
- Sales trends
- Customer performance
- Product performance
- Profitability
- Market performance
- Shipping performance
- Delivery performance

SQL techniques used include:
·`SELECT` 
· `WHERE` 
· `GROUP BY` 
· `ORDER BY` 
· `JOIN` 
· `CASE` 
· `COUNT` 
· `SUM` 
· `AVG` 
· `ROUND` 
· `DISTINCT` 
· `CTEs` 
· `Window Functions`

---

## 📈 Project Outcome

This project demonstrates the ability to take raw business data through the complete analytics process:

**Clean → Transform → Analyze → Visualize → Interpret → Recommend**

It demonstrates practical experience with **Excel, MySQL, Power BI, and DAX**, while focusing on translating data into business insights rather than simply creating visualizations.

---

## 👤 About the Project

**Project Type:** Data Analytics Portfolio Project\
**Focus:** Supply Chain, Sales, Customers, Products & Logistics\
**Tools:** Microsoft Excel, MySQL, Power BI & DAX\
**Dataset Source:** DataCo Supply Chain Dataset — Kaggle. The original dataset was transformed and normalized into five analytical tables: Customers, Products, Orders, Order Items, and Shipping\
