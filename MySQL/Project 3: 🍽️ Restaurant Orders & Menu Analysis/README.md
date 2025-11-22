# 🍽️ Restaurant Orders & Menu Analysis – MySQL Project

This project explores a restaurant’s sales and menu performance using MySQL.
Using a structured database schema, SQL queries, and real-world styled order data, the goal is to answer key business questions such as:

* Which menu items and categories are most popular?
* How does customer spending vary by order?
* What are the busiest periods for the restaurant?
* Which orders generate the highest revenue?

---

## 📂 Project Files

* `create_restaurant_db.sql`

  * Creates the `restaurant_1_db` schema.
  * Defines the core tables: `menu_items` and `order_details`.
  * Inserts sample records into both tables.

* `menu_items.csv`

  * CSV version of the menu items table.

* `order_details.csv`

  * CSV version of the order details table.

* `restaurant_db_data_dictionary.csv`

  * Data dictionary describing each table and column.

* `insights.sql`

  * Collection of SQL queries used to explore and analyze the data.

---

## 🧱 Database Schema

### 1️⃣ `menu_items` table

Basic information about each menu item.

| Field          | Type          | Description                                       |
| -------------- | ------------- | ------------------------------------------------- |
| `menu_item_id` | SMALLINT (PK) | Unique ID of a menu item                          |
| `item_name`    | VARCHAR(45)   | Name of the menu item                             |
| `category`     | VARCHAR(45)   | Cuisine/category (American, Asian, Mexican, etc.) |
| `price`        | DECIMAL(5,2)  | Price in US dollars                               |

### 2️⃣ `order_details` table

Each row represents a single item within an order.

| Field              | Type          | Description                            |
| ------------------ | ------------- | -------------------------------------- |
| `order_details_id` | SMALLINT (PK) | Unique ID of an item entry in an order |
| `order_id`         | SMALLINT      | Order identifier                       |
| `order_date`       | DATE          | Date of the order                      |
| `order_time`       | TIME          | Time of the order                      |
| `item_id`          | SMALLINT      | Links to `menu_items.menu_item_id`     |

---

## 📊 Dataset Overview

From the provided CSVs:

* **Date Range:** 1 Jan 2023 – 31 Mar 2023
* **Total Orders:** 5,370 (distinct `order_id`)
* **Total Line Items:** 12,234 (rows in `order_details`)
* **Menu Categories:** American, Asian, Mexican, Italian
* **Number of Items on the Menu:** 32

---

## 🔍 Key Business Questions & Analyses

The `insights.sql` script is organized into sections:

### 🧾 A. Menu Exploration (`menu_items`)

Sample questions:

* How many items are on the menu?
* What are the **least** and **most** expensive items?
* How are items distributed across categories (American, Asian, Mexican, Italian)?

Example queries:

* View all menu items
* Sort items by price
* Group items by category and count them

---

### 🧾 B. Order Details Exploration (`order_details`)

Sample questions:

* What is the **date range** of the orders?
* How many **orders** were placed in that period?
* How many **items** were ordered in total?
* Which orders had the **most items**?
* How many orders had **more than 12 items**?

Example analyses:

* Count distinct `order_id`
* Count total rows in `order_details`
* Group by `order_id` to find large orders

---

### 🔗 C. Joining Orders with Menu Items

By joining `order_details` with `menu_items`, we can answer more advanced questions:

* What are the **least and most ordered items**, and which categories do they belong to?
* Which **categories** are ordered the most?
* Which items generate the **highest revenue**?
* Which **orders** have the highest total spend?

Key operations used:

* `LEFT JOIN` on `order_details.item_id = menu_items.menu_item_id`
* `GROUP BY` with `COUNT()` for popularity
* `GROUP BY` with `SUM(price)` for revenue metrics

---

## 💡 Example Insights (from the data)

Some insights derived from the dataset:

* **Most popular items** (by number of times ordered):

  * Hamburger
  * Edamame
  * Korean Beef Bowl
  * Cheeseburger
  * French Fries

* **Most ordered categories**:

  * Asian is the most ordered category, followed by Italian, Mexican, and American.

* **Highest spending orders**:

  * The top order (`order_id = 440`) spent approximately **$192.15**.
  * Several other orders (e.g., 2075, 1957, 330, 2675) are also high-value orders.

These insights help understand customer preferences and high-value transactions.

---

## 🛠️ Tools & Skills Used

* **Database:** MySQL
* **Language:** SQL
* **Concepts Practiced:**

  * Creating schemas and tables
  * Defining primary keys
  * Inserting data
  * Filtering with `WHERE`
  * Aggregation with `COUNT`, `SUM`, `MIN`, `MAX`
  * Grouping with `GROUP BY` and `HAVING`
  * Sorting with `ORDER BY`
  * Joining tables (`LEFT JOIN`)
  * Basic exploratory analysis with SQL

---

## 🚀 How to Run This Project

1. **Clone or download** this repository to your local machine.

2. **Open MySQL** (Workbench, VS Code extension, or CLI).

3. **Run the database creation script:**

   ```sql
   SOURCE create_restaurant_db.sql;
   ```

   This will:

   * Create the `restaurant_1_db` schema
   * Create `menu_items` and `order_details` tables
   * Insert the sample data

4. *(Optional)* If you want to inspect or reload data from CSVs, you can use:

   ```sql
   LOAD DATA INFILE 'path/to/menu_items.csv' 
   INTO TABLE menu_items
   FIELDS TERMINATED BY ','
   IGNORE 1 LINES;
   ```

   and similarly for `order_details`.

5. **Run the analysis queries:**

   ```sql
   USE restaurant_1_db;
   SOURCE insights.sql;
   ```

   This will execute the exploratory and analytical queries used in the project.

---

## 🎯 Learning Outcomes

Through this project, I practiced:

* Designing a simple relational schema for a restaurant scenario
* Importing and managing data in MySQL
* Answering real-world business questions using SQL
* Combining tables with joins to derive meaningful insights
* Working with date, time, and aggregated metrics

---

## 🔖 Project Tags

`#MySQL` `#SQLProject` `#RestaurantAnalytics` `#DataAnalysis`
`#SQLJoins` `#BusinessIntelligence` `#DataExploration`

---

## 👤 About Me

I’m **Muhammed Thaha Uwais**, an aspiring data analyst, building projects in SQL, Excel, Python, Power BI, and Tableau to strengthen my analytics skills and portfolio.

* 🔗 **LinkedIn:** [muhammed-thaha-uwais-5b5444279](https://www.linkedin.com/in/muhammed-thaha-uwais-5b5444279/)

If you have any feedback, suggestions, or opportunities, feel free to connect with me on LinkedIn!

