# Customer Churn & Retention Analytics Dashboard

An end-to-end business intelligence solution designed to monitor user retention, track revenue impact, and surface high-risk accounts for proactive intervention. Built using **PostgreSQL** and **Power BI**, following a structured Star Schema architecture.

---

## 📊 Project Overview

In subscription-driven businesses, understanding *why* customers leave is just as important as knowing *when* they leave. This project simulates a real-world SaaS analytics workflow where leadership needs high-level health metrics and Customer Success (CS) teams need actionable, account-level tracking.

The dashboard provides a 3-section layout separating executive KPIs, subscription-level churn drivers, and an operational customer risk register.

---

## 🏗️ Architecture & Data Model

The project relies on a clean **Star Schema** to ensure optimal query performance and scalable reporting:

* **Fact Table (`fact_customer_churn`)**: Contains transactional and behavioral records, including the binary churn indicator (`1` for churned, `0` for active) and total spend.
* **Dimension Tables (`dim_customer`, `dim_subscription`)**: Stores descriptive attributes such as customer demographics and subscription tier metadata.
* **Relationships**: Enforced via a **One-to-Many ($1 \to \ast$)** structure flowing downstream from dimensions to the fact table.

---

## 🛠️ Tech Stack & Tools

* **Database & Querying:** PostgreSQL (Data extraction, transformation, and validation)
* **Data Modeling & Visualization:** Power BI Desktop
* **Calculations:** DAX (Data Analysis Expressions)
* **Version Control:** Git & GitHub

---

## 📈 Key Dashboard Features & Metrics

1. **Executive KPI Layer (Top Row):**
* **Total Customers:** Overall customer volume count (`COUNTROWS`).
* **Churned Customers:** Exact headcount of lost users using binary sum logic (`SUM(churn)`).
* **Overall Churn Rate:** Safe division metric (`DIVIDE`) highlighting immediate business health.
* **Total Spend / Revenue:** Financial aggregation tracking total revenue exposure.


2. **Churn Breakdown (Trend Section):**
* Visualizes churn distribution across subscription tiers (`Basic`, `Standard`, `Premium`) to identify high-attrition pricing or plan structures.


3. **Operational Customer Success Table (Action Table):**
* Bridges analytics and action by listing specific customer IDs, tier levels, and individual spend/churn status so retention teams can prioritize outreach.


4. **Global Slicers:**
* Dynamic filtering capabilities allowing stakeholders to slice data instantly across all visuals by subscription type.

---

## 🚀 DAX Measures Highlights

Here are a few core formulas used within the model:

```dax
-- Counts total churned users using binary classification
Churned Customers = SUM('public fact_customer_churn'[churn])

-- Calculates overall percentage safely avoiding divide-by-zero errors
Overall Churn Rate = DIVIDE([Churned Customers], [Total Customers], 0)

-- Aggregates financial scale
Total Spend = SUM('public fact_customer_churn'[total_spend])

```

---

## 💡 How to Explore This Project

1. **Clone the repository:**
```bash
git clone https://github.com/jawhor-ali/customer-churn-dashboard.git

```


2. **Database Setup:** Run your PostgreSQL scripts to populate the star schema tables.
3. **Power BI:** Open the `.pbix` file in Power BI Desktop to explore the data model, DAX measures, and interactive layout.

---

## 👤 Author

**Jawhor Ali Khan**

*Aspiring Business Analyst / Data Professional*
