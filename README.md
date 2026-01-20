# 📊 Flipkart Sales Analysis using MySQL

## 📌 Project Overview
This project analyzes Flipkart-style e-commerce sales data using **MySQL** to uncover insights related to:
- Sales performance
- Discount impact
- Seller reliability
- Brand contribution
- Inventory and supply risk
- Time-based revenue trends

The project is designed to simulate a **real-world data analyst / business analyst use case**.

---

## 🗂️ Dataset
- **Source**: Simulated Flipkart product sales data  
- **Format**: CSV  
- **Records Include**:
  - Product details
  - Seller & brand information
  - Pricing & discounts
  - Ratings & reviews
  - Stock & sales volume
  - Listing dates

📁 File: `data/flipkard.csv`

---

## 🛠️ Tools & Technologies
- **MySQL**
- SQL Views
- Window Functions
- Aggregate Functions
- Date & Time Analysis

---

## 🧱 Database Schema
Key fields used:
- `product_id`
- `product_name`
- `brand`
- `seller`
- `price`, `discount_percent`, `final_price`
- `rating`, `units_sold`, `stock_available`
- `listing_date`

---

## 📈 Key Analysis Performed

### 🔹 Sales & Revenue Analysis
- Total revenue and units sold
- Brand-wise revenue contribution
- Year-wise and month-wise sales trends
- Year-over-Year (YoY) & Month-over-Month (MoM) growth

### 🔹 Discount Impact
- Discount vs No-discount performance
- Revenue per unit by discount percentage
- Discount bucket analysis (Low / Medium / High)

### 🔹 Seller Performance & Risk
- Seller sales volume and stock
- Seller risk classification (Low / Medium / High)
- Seller reliability index

### 🔹 Product & Inventory Insights
- Delivery speed categorization
- Supply risk detection (Overstock / Urgent Restock)
- Product performance score calculation

---

## 🧠 Advanced SQL Concepts Used
- `CASE WHEN`
- `WINDOW FUNCTIONS (LAG, RANK)`
- `VIEWS`
- `AGGREGATIONS`
- `DATE FUNCTIONS`
- `NULL HANDLING`

---

## 📊 Sample Business Questions Answered
- Do discounts really increase revenue?
- Which brands contribute the most to sales?
- Who are the high-risk sellers?
- Which months generate peak revenue?
- Which products need urgent restocking?

---

## 🚀 How to Run This Project

1. Create database and tables:
```sql
source sql/database_setup.sql;
