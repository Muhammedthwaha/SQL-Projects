# 📊 Data Cleaning Portfolio Project — Tech Layoffs Dataset (MySQL)

### 👤 Author: **Muhammed Thaha Uwais**  
**Role:** Data Analyst & Developer  
**Tools Used:** MySQL, Excel, CSV Dataset

---

## 🧠 Project Overview

This project demonstrates a **complete data cleaning process using SQL** on a dataset containing details about **global tech layoffs**.  
The goal is to transform raw, messy data into a clean, standardized format that can be used for further analysis and visualization.

---

## 📁 Project Files

| File Name | Description |
|------------|--------------|
| **`layoffs.csv`** | Raw dataset containing company layoff data. |
| **`1. Remove Duplicates.sql`** | Identifies and removes duplicate rows using CTE and `ROW_NUMBER()` window function. |
| **`2. Standardize the data.sql`** | Cleans and standardizes inconsistent values (company names, dates, and country names). |
| **`3. Null values or Blank values.sql`** | Handles missing or blank data in key columns using `UPDATE` and `CASE` logic. |
| **`4. Remove any columns or Rows.sql`** | Drops unnecessary columns or rows after validation. |


---

## 🧩 Dataset Description

**File:** `layoffs.csv`  
**Source:** Public dataset from tech layoff reports and business data sites.  
**Columns include:**
- `company` – Name of the company  
- `location` – City or region  
- `industry` – Type of industry (e.g., Tech, Finance, Retail)  
- `total_laid_off` – Number of employees laid off  
- `percentage_laid_off` – % of total workforce affected  
- `date` – Date of announcement  
- `stage` – Funding or business stage (e.g., Series A, Post-IPO)  
- `country` – Country name  
- `funds_raised_millions` – Total capital raised (in millions USD)

---

## 🧹 Data Cleaning Workflow

### 1️⃣ **Remove Duplicates**
- Used a **CTE (`WITH` clause)** and `ROW_NUMBER()` function to detect duplicates based on multiple key columns.  
- Retained only the first unique record.

```sql
WITH duplicate_cte AS (
  SELECT *,
  ROW_NUMBER() OVER (
    PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
  ) AS row_num
  FROM layoffs_staging
)
DELETE FROM duplicate_cte WHERE row_num > 1;
```

---

### 2️⃣ **Standardize Data**
- Cleaned inconsistent `company` and `country` names using `TRIM()`, `LOWER()`, and `UPDATE`.
- Fixed `date` format with `STR_TO_DATE()`.
- Removed trailing or leading characters in text columns.

---

### 3️⃣ **Handle Null and Blank Values**
- Checked for missing values in key fields (`industry`, `country`, `stage`).
- Replaced nulls using existing data or “Unknown”.
- Verified using conditional queries and `IS NULL`.

---

### 4️⃣ **Remove Unnecessary Columns/Rows**
- Dropped intermediate or redundant columns not needed for analysis.
- Ensured the final table contains only relevant features for analytics and visualization.

---

## 🧾 Example Insights (After Cleaning)

Once cleaned, the dataset can be used to answer:
- Which industries had the highest layoffs?
- Which countries and years were most affected?
- What is the relationship between funds raised and layoffs?
- Trends in layoffs over time.

---

## 🧠 Key SQL Concepts Used

- `CTE (Common Table Expressions)`  
- `ROW_NUMBER()` Window Function  
- `TRIM()`, `REPLACE()`, `UPPER()`, `LOWER()`  
- `CASE` and `IFNULL()`  
- `DELETE`, `UPDATE`, `ALTER TABLE`  
- `STR_TO_DATE()` for date conversion  

---

## ⚙️ How to Run

1. Open **MySQL Workbench** (or any MySQL interface).  
2. Import the **`layoffs.csv`** file into a new database (e.g., `layoffs_project`).  
3. Run the SQL scripts in order:
   ```bash
   1. Remove Duplicates.sql
   2. Standardize the data.sql
   3. Null values or Blank values.sql
   4. Remove any columns or Rows.sql
   ```
4. Optionally, run `Portfolio Project - Data Cleaning.sql` to execute all steps together.

---

## 📈 Outcome

✅ Clean, structured data ready for analysis  
✅ Improved data consistency and accuracy  
✅ Demonstrates end-to-end SQL data cleaning proficiency  

---

## 🧰 Tools Used

- **MySQL 8.0**
- **Excel / CSV for data review**
- **VS Code / MySQL Workbench** for SQL scripting

---

## 📬 Contact

**👤 Muhammed Thaha Uwais**  
📧 Email: [muhammedthahauwais@gmail.com](mailto:muhammedthahauwais@gmail.com)  
🔗 LinkedIn: [https://www.linkedin.com/in/muhammed-thaha-uwais-5b5444279](https://www.linkedin.com/in/muhammed-thaha-uwais-5b5444279)

---
