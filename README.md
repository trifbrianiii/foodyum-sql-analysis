# FoodYum Grocery Store Sales Analysis

## 📌 Project Overview

FoodYum is a grocery store chain based in the United States.

This project focuses on cleaning and analyzing product data using
PostgreSQL. The analysis prepares the product data for further
analysis and addresses business questions related to product prices
and sales performance.

## 🎯 Objectives

- Identify missing values in the product dataset
- Clean and standardize product data
- Handle missing numerical and categorical values
- Convert text-based weight data into numeric values
- Analyze price ranges across product categories
- Identify Meat and Dairy products with high sales volume

## 🛠️ Tools & Technologies

- PostgreSQL
- SQL
- GitHub

## 📊 Analysis Tasks

### Task 1 — Missing Values

Identify the number of products with missing `year_added` values.

### Task 2 — Data Cleaning

Clean the product dataset by:

- Replacing missing categorical values with `Unknown`
- Replacing missing `year_added` with `2022`
- Replacing missing `average_units_sold` with `0`
- Replacing missing weight and price with their overall median
- Converting weight values from text to numeric
- Standardizing categorical and text values

### Task 3 — Price Range by Product Type

Calculate the minimum and maximum price for each product category.

### Task 4 — High-Selling Meat and Dairy Products

Identify Meat and Dairy products where average monthly units sold
is greater than 10.

## 💡 SQL Skills Demonstrated

- `SELECT`
- `WHERE`
- `COUNT`
- `COALESCE`
- `NULLIF`
- `TRIM`
- `REPLACE`
- `UPPER`
- `PERCENTILE_CONT`
- `ROUND`
- `MIN`
- `MAX`
- `GROUP BY`
- `IN`
- `AND`

## 📁 Project Files

| File | Description |
|---|---|
| `foodyum_analysis.sql` | SQL queries for data cleaning and analysis |
| `README.md` | Project documentation |
