Here is the **updated README** with the correct file name **`Raw Dataset.csv`** instead of `zepto_v2.csv` — everything else is kept the same.

---

````markdown
# 📦 Zepto Inventory & Pricing Analysis — PostgreSQL Project

## 🧠 Project Overview

This project focuses on analyzing **inventory, pricing, and discount strategies** for an online grocery platform (Zepto-style dataset) using **PostgreSQL**.

Using raw product-level data (MRP, selling price, discount, stock levels, weight, and categories), the goal is to answer key **business questions** around:

- Best-value products  
- Stock issues on high-value items  
- Revenue estimation  
- Discount strategy effectiveness  
- Inventory weight distribution  

This project is ideal for showcasing **SQL + analytics skills** for data analyst / BI roles.

---

## 📁 Project Structure

```text
PostgreSQL-Zepto-Analysis/
│
├── Raw Dataset.csv                  # Raw product-level dataset (source data)
├── Script.sql                        # Main PostgreSQL analysis script (all queries)
├── Business insights questions.txt   # List of business questions solved
└── README.md                         # Project documentation (this file)
````

---

## 🎯 Business Questions Solved

The analysis answers the following questions: 

1. **Top 10 best-value products** based on the **discount percentage**.
2. **Products with high MRP but Out Of Stock** (OOS).
3. **Estimated revenue per category** using discounted selling price and available quantity.
4. Products where **MRP > 500** and **discount < 10%** (low-discount, high-price items).
5. **Top 5 categories** with the highest **average discount percentage**.
6. **Price per gram** for products above 100g, sorted by best value.
7. Grouping products into **Low, Medium, Bulk** categories based on their **weight in grams**.
8. **Total inventory weight per category** (category-level stock weight).

Each of these questions is implemented inside `Script.sql`.

---

## 🛠️ Tools & Technologies

* **Database:** PostgreSQL
* **Language:** SQL
* **Data Source:** Raw Dataset.csv
* **Concepts Used:**

  * `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`
  * Aggregate functions: `SUM()`, `AVG()`, `COUNT()`
  * `CASE` statements
  * `DISTINCT`, `HAVING`
  * Calculated metrics (discount %, price per gram, total revenue)
  * Inventory weight analysis
  * Number formatting using `to_char()`

---

## 🧾 Key Metrics & Logic Used


### **Estimated Revenue per Category**

```sql
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
```

### **Price per Gram**

```sql
discountedSellingPrice / weightInGrams AS price_per_gram
```

### **Weight Category Classification**

```sql
CASE
    WHEN weightInGrams < 1000 THEN 'Low'
    WHEN weightInGrams < 5000 THEN 'Medium'
    ELSE 'Bulk'
END AS weight_category
```

### **Total Inventory Weight**

```sql
SUM(weightInGrams * availableQuantity) AS total_weight
```

---

## 🚀 How to Run the Project

### **1. Create a PostgreSQL Database**

```sql
CREATE DATABASE zepto_analysis;
```

### **2. Create a Table & Import Data**

Import **Raw Dataset.csv** using:

*  pgAdmin → Import

### **3. Run the SQL Script**

Execute `Script.sql` to generate:

* Best-value product lists
* Revenue calculations
* Inventory weight summaries
* Discount-based insights

---

## 📊 Use Cases

* **Business Teams:** Improve pricing and discount strategy
* **Portfolio Projects:** Show SQL expertise
* **Interviews:** Demonstrate analytical thinking

---


## 🙋‍♂️ About the Author

**Muhammed Thaha Uwais**
Aspiring **Data Analyst** skilled in:

* SQL (PostgreSQL, MySQL)
* Data Cleaning & EDA
* Tableau & Power BI
* Python & Excel

Looking for opportunities in **data analytics** to apply analytical and visualization skills.

* 🔗 LinkedIn: *(https://www.linkedin.com/in/muhammed-thaha-uwais-5b5444279/)*

---


