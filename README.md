# 🛒 SQL Case Study: Total Cost of Orders per Customer

## 📌 Problem

Find the **total cost of each customer's orders**.

Return:

* `customer id`
* `first_name`
* `total_order_cost`

Sort results by **first_name (ascending)**.

---

## 🧠 Business Context

Understanding customer spending is essential for:

* Customer segmentation
* Revenue analysis
* Marketing targeting

This query calculates **lifetime value (LTV proxy)** using total order cost.

---

## 🗂️ Data Overview

### customers

| id | first_name | last_name | city          |
| -- | ---------- | --------- | ------------- |
| 1  | Mark       | Thomas    | Arizona       |
| 3  | Farida     | Joseph    | San Francisco |
| 5  | Henry      | Jackson   | Miami         |
| 7  | Jill       | Michael   | Austin        |
| 12 | Eva        | Lucas     | Arizona       |

---

### orders

| id | cust_id | order_date | total_order_cost |
| -- | ------- | ---------- | ---------------- |
| 1  | 3       | 2019-03-04 | 100              |
| 2  | 3       | 2019-03-01 | 80               |
| 3  | 3       | 2019-03-07 | 30               |
| 11 | 5       | 2019-02-01 | 80               |
| 4  | 7       | 2019-02-01 | 25               |

> Note: Data is truncated for readability.

---

## 🧩 Approach

### Step 1 — Join Tables

* Join `orders` with `customers`
* Match `cust_id` → `customers.id`

### Step 2 — Aggregate

* Sum `total_order_cost` per customer

### Step 3 — Sort

* Order by `first_name`

---

## ⚡ Final Solution (Portable SQL)

```sql
SELECT 
    c.id,
    c.first_name,
    SUM(o.total_order_cost) AS total_order_cost
FROM orders o
JOIN customers c
    ON c.id = o.cust_id
GROUP BY 
    c.id,
    c.first_name
ORDER BY c.first_name ASC;
```

---

## 🧪 Initial Attempt (Issue)

```sql
SELECT 
    o.cust_id AS id,
    c.first_name,
    SUM(total_order_cost)
FROM orders o
JOIN customers c 
    ON c.id = o.cust_id
GROUP BY o.cust_id;
```

⚠️ Problem:

* Missing `first_name` in GROUP BY (not valid in strict SQL engines)
* Not fully portable

---

## ⚙️ Performance Considerations

* Aggregation happens after join → efficient for indexed keys
* GROUP BY on primary key (`id`) is optimal
* Scales well for large transactional datasets

---

## 🧠 Assumptions

* Each order belongs to one customer
* No missing customer references
* `total_order_cost` is always valid

---

## 📊 Key Insights

* Aggregation is essential for business metrics
* JOIN + GROUP BY is a core SQL pattern
* Proper grouping ensures correct results

---

## 📈 Business Takeaway

Customer total spend helps:

* Identify high-value customers
* Drive retention strategies
* Optimize marketing spend

---

## 🧪 Skills Demonstrated

* SQL JOIN (inner join)
* Aggregation (`SUM`)
* GROUP BY correctness
* Business metric calculation
* Portable SQL design

---

## ▶️ How to Use

1. Copy query into your SQL environment
2. Run against `orders` and `customers`
3. Validate output

---

## 📌 Repository Structure

* `solution.sql` → initial query
* `optimized_solution.sql` → corrected, production-ready query
* `insights.md` → summarized learnings

---

## 🚀 Final Note

This project demonstrates how to:

* Combine multiple tables
* Compute real business metrics
* Write clean, scalable SQL queries
