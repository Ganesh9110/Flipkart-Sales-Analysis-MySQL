# 📊 Flipkart Sales Analysis using MySQL
A comprehensive SQL project analyzing e-commerce sales, discounts, seller performance, and inventory risks using Flipkart-style data.

## 📌 Project Overview
This project performs an in-depth **sales and business analysis** on Flipkart-style e-commerce data using **MySQL**.  
The goal is to derive **actionable insights** related to sales performance, discounts, seller reliability, inventory risk, and time-based trends.

This project simulates a **real-world data analyst use case** and demonstrates strong SQL querying and analytical skills.

---

## 🗂️ Dataset Description
- **Type:** E-commerce product sales data
- **Format:** CSV
- **Records Include:**
  - Product and category details
  - Brand and seller information
  - Pricing, discounts, and final price
  - Ratings and review counts
  - Stock availability and units sold
  - Listing dates and delivery details

📁 Dataset File: `flipkard.csv`

---

## 🛠️ Tools & Technologies
- MySQL
- SQL Views & Window Functions
- Aggregate & Date Functions
- Data Cleaning & Validation (NULL handling, COALESCE, NULLIF)


---

## 🧱 Database Schema
Main table: `product_table`

Key columns:
- `product_id` (Primary Key)
- `product_name`
- `category`, `brand`
- `seller`, `seller_city`
- `price`, `discount_percent`, `final_price`
- `rating`, `review_count`
- `units_sold`, `stock_available`
- `listing_date`
- `delivery_days`
- `seller_rating`

---

## 📈 Analysis Performed

### 🔹 Sales & Revenue Analysis
- Total revenue and units sold
- Brand-wise revenue contribution
- Year-wise and month-wise sales trends
- Year-over-Year (YoY) growth analysis
- Month-over-Month (MoM) growth analysis
- Peak sales month identification

---

### 🔹 Discount Impact Analysis
- Discount vs No Discount performance
- Revenue per unit across discount buckets
- Effectiveness of discounts on sales

---

### 🔹 Seller Performance & Risk Analysis
- Seller-wise performance & stock
- Risk classification (Low / Medium / High)
- Reliability index calculation

---

### 🔹 Product & Inventory Analysis
- Delivery speed classification (Fast / Standard / Slow)
- Supply risk identification:
  - Overstock
  - Urgent Restock
  - Normal
- Product performance score calculation based on:
  - Ratings
  - Units sold
  - Discount percentage

---

## 🧠 Advanced SQL Concepts Used
- `CASE WHEN` conditional logic
- `WINDOW FUNCTIONS` (`LAG`, `RANK`)
- `VIEWS` for reusable analytics
- `AGGREGATE FUNCTIONS`
- `DATE FUNCTIONS`
- `NULL HANDLING` using `COALESCE` and `NULLIF`

---


## 📁 SQL Views Created
    View Name                             Purpose
- delivery_speed                =         Classifies products by delivery time
- discount_performance          =         Evaluates discount impact on revenue
- seller_risk_analysis          =         Categorizes sellers into risk levels
- monthly_business              =         Tracks monthly sales & revenue
- supplying_risk                =         Flags inventory risks
- seller_reliability            =         Calculates seller reliability index
- executive_summary             =         Provides overall business KPIs

---

## 🚀 How to Run
1. Clone this repository
2. Import `flipkard.csv` into MySQL
3. Run `schema.sql` → creates database & tables
4. Run `analysis.sql` → executes queries & views
5. Explore results with `SELECT`

-----
