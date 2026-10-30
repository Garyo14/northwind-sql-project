# Northwind Sales Analysis with SQL

SQL project analyzing the Northwind sales database to segment customers
and uncover product insights. Built with SQLite and DB Browser for SQLite.

## Objective
Identify which customers drive the most revenue and which product
categories sell best across customer segments.

## Dataset
Northwind sample database (SQLite version), including Customers, Orders,
Order Details, Products, and Categories tables.

## SQL Skills Demonstrated
- Multi-table JOINs (up to 5 tables)
- Common Table Expressions (CTEs)
- Subqueries
- Window functions: `NTILE()`, `RANK()`
- Aggregation with `GROUP BY` and `HAVING`

## Key Findings
- Segmented 93 customers into 4 revenue tiers using `NTILE(4)`
- The top tier (24 customers) generated 28.7% of ~$448M total revenue
- Beverages was the best-selling category in every tier
- Revenue is fairly evenly distributed across tiers (28.7% to 22.2%)

## Project Structure
| File | Description |
|---|---|
| `queries/01_basic_select.sql` | Basic SELECT, WHERE, ORDER BY |
| `queries/02_join_products_categories.sql` | JOIN across tables |
| `queries/03_subquery_above_avg_price.sql` | Subquery example |
| `queries/04_window_rank_products.sql` | RANK window function |
| `queries/05_customer_tiers_ntile.sql` | Customer segmentation with NTILE |
| `queries/06_category_by_tier.sql` | Category performance per tier |

## Tools
SQLite, DB Browser for SQLite
