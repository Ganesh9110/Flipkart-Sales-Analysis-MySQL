# 📊 Flipkart Sales Analysis using MySQL

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

## 🛠️ Tools & Technologies Used
- **MySQL**
- SQL Views
- Window Functions
- Aggregate Functions
- Date & Time Functions

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
- Revenue and units sold by discount bucket
- Revenue per unit across discount percentages
- Evaluation of discount effectiveness

---

### 🔹 Seller Performance & Risk Analysis
- Seller-wise sales and stock analysis
- Average seller rating evaluation
- Seller risk classification:
  - Low Risk
  - Medium Risk
  - High Risk
- Seller reliability index calculation

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
- `delivery_speed`
- `discount_performance`
- `seller_risk_analysis`
- `monthly_business`
- `supplying_risk`
- `seller_reliability`
- `executive_summary`

---


