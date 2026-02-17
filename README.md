# 🌍 World Life Expectancy — Data Cleaning & Exploratory Data Analysis

##📌 Project Overview

This project focuses on **cleaning, preparing, and exploring the World Life Expectancy dataset** to make it reliable for analysis and to uncover meaningful global health insights.

The workflow follows a real-world analytics pipeline:

**Raw Data → Data Cleaning → Exploratory Analysis → Insights**


## 🎯 Objectives

1. Improve dataset quality by fixing structural issues.
2. Handle duplicates and missing values.
3. Standardize categorical fields.
4. Perform exploratory analysis to identify patterns and relationships.
5. Prepare the dataset for visualization or advanced analytics.


## 🛠️ Tools Used

* **SQL (MySQL)** — Data cleaning & analysis
* **GitHub** — Documentation & version control

## 📂 Dataset Features

* Country
* Year
* Life Expectancy
* Adult Mortality
* GDP
* BMI
* Development Status (Developed / Developing)


## 🧹 Data Cleaning Process

### ✔ Removed Duplicate Records

Used window functions (`ROW_NUMBER`) to ensure one record per country per year.

### ✔ Handled Missing Values

Identified blank and NULL values in key fields such as Life Expectancy and Status.

### ✔ Imputed Missing Life Expectancy

Estimated missing values using the average of the previous and next year to maintain time-series continuity.

### ✔ Standardized Categories

Validated and corrected `Status` labels to ensure consistency.

### ✔ Data Validation Checks

Used DISTINCT queries and aggregations to confirm data integrity before analysis.


## 📊 Exploratory Data Analysis (EDA)

After cleaning, exploratory analysis was conducted to understand trends and relationships in global health data.

### 🔎 Key Questions Explored

1 How has life expectancy changed over time by country?
2 What is the difference in life expectancy between Developed and Developing nations?
3 Is there a relationship between GDP and life expectancy?
4 How does BMI correlate with longevity across countries?
5 Which countries show the largest improvement in life expectancy over 15 years?


### 📈 Analytical Techniques Used

* Grouped aggregations to compare country-level averages
* Window functions to analyze time-based trends
* Conditional aggregation to compare high vs low GDP countries
* Correlation-style comparisons (BMI vs Life Expectancy)
* Rolling totals to observe mortality trends

---

## 💡 Sample Insights Generated

* Countries with higher GDP generally showed higher average life expectancy.
* Developed countries maintained consistently higher longevity than developing nations.
* Some nations demonstrated rapid improvement due to healthcare and economic growth.
* Filling missing values prevented distorted trend analysis.


## ✅ Outcome

The project delivers a **fully cleaned and analysis-ready dataset**, along with SQL-driven exploration that reveals meaningful global health patterns.


**Aryan Darji**
Data Analyst | SQL | Data Cleaning | Exploratory Analysis
