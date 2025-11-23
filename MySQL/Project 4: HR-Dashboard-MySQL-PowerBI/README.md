
# 📊 HR Dashboard – MySQL + Power BI Project

## 📁 Project Overview

This project showcases a complete **end-to-end HR Analytics workflow** using:

* **MySQL** for data cleaning and analysis
* **CSV exports** for processed insights
* **Power BI** for dashboard creation and data storytelling

The goal of this project is to analyze HR employee data, derive meaningful insights using SQL, and visualize those insights through an interactive Power BI dashboard.

---

## 🧭 Project Workflow

### **1️⃣ Data Analysis in MySQL**

The project begins by analyzing the raw HR dataset using **SQL queries**.

The SQL file includes:

* Data cleaning
* Missing value handling
* Date standardization
* Feature creation (age group, employment length, termination fields)
* Employee distribution analysis
* Key HR metrics extraction

All insights were generated through your SQL logic in **`data_analysis.sql`**.

---

### **2️⃣ Exporting Insights to CSV**

Once insights were generated in MySQL:

* The result sets were exported to **multiple CSV files**
* Each CSV file represents a cleaned, structured dataset ready for Power BI
* This ensures a direct, optimized input for dashboards
  *(No heavy transformations required inside Power BI)*

---

### **3️⃣ Power BI Dashboard Creation**

Using the exported CSV files, an interactive HR dashboard was built that includes:

### 📌 **Key Metrics & KPIs**

* Average length of employment
* Employee distribution by department
* Gender ratio
* Race/ethnicity distribution
* Work location (HQ vs Remote)
* Yearly employee changes
* Termination analysis

### 📊 **Visuals Included**

* Gender distribution chart
* Age-group analysis
* Race distribution bar chart
* Employee trend line chart (2000–2020)
* Location (states) distribution
* Department-wise termination rate
* Gender distribution within each department
* Employee distribution by work type (HQ / Remote)

### 🧭 Dashboard Navigation

Page 1 → Overall HR Overview
Page 2 → Age, Gender & Department insights

---

## 📂 Repository Structure

```
📁 HR-Dashboard-MySQL-PowerBI
│
├── data_analysis.sql          # SQL insights, metrics creation, cleaning steps
├── data_cleaning.sql          # Additional cleaning scripts
├── HR Employee Report.pbix    # Final Power BI dashboard
├── HR Employee Report.pdf     # Exported report
├── Human Resources.csv        # Source dataset
├── Insights/CSV Files         # All exported CSVs from SQL output
```

---

## 🧠 Key Insights From the Analysis

Some insights uncovered during the analysis:

* Average employee tenure is around **8 years**, reflecting good retention
* Majority of employees fall within **35–54 age range**
* **Headquarters** employs more staff compared to remote locations
* Several states such as **Ohio and Pennsylvania** have the largest employee base
* Some departments show higher termination rates, indicating a need for HR review
* Gender distribution varies significantly across departments
* Employee count shows a consistent change across years (2000–2020)

---

## 🛠 Tools & Technologies Used

* **MySQL** – Data cleaning, transformations, and analysis
* **SQL** – Feature creation & insights generation
* **CSV Files** – Exported clean datasets
* **Power BI** – Interactive visualization and dashboard design

---

## 🚀 How to Use This Project

1. Clone or download the project repository
2. Review `data_analysis.sql` & `data_cleaning.sql`
3. Check the exported CSV files containing SQL insights
4. Open `HR Employee Report.pbix` in **Power BI Desktop**
5. Refresh data if needed and explore the visuals

---

## 👤 About the Author

**Muhammed Thaha Uwais**

* Aspiring **Data Analyst** with experience in **Power BI, SQL, Excel, and Python**.
* Passionate about turning raw data into clear, actionable insights for business decision-making.

Feel free to connect with me on **LinkedIn** and share your feedback or suggestions!


