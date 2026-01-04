# ccac-bookstore-inventory-system
English Translation Comprehensive Relational Database Management System for a Bookstore. This project includes schema design (ERD), data normalization, implementation of indexes for optimization, and advanced SQL queries (complex Joins, Subqueries, and Aggregations) for business decision making.

Database Design & Relationships (ERD)
This database follows a relational model designed to maintain data integrity and minimize redundancy.

One-to-Many Relationships:

A Customer can place multiple Orders.

A Department categorizes many Products.

A Supplier provides various Products.

Many-to-Many Relationship:

The Order_Items table acts as a bridge between Orders and Products, allowing multiple products per order and tracking specific quantities and prices at the time of sale.

Key SQL Skills Demonstrated
Data Normalization: Applied to ensure efficient data storage across 6 related tables.

Indexing: Created idx_order_date and idx_product_name to speed up search queries in large datasets.

Business Intelligence:

Subqueries: Used to identify customers who spend above the average.

Joins: Multi-table joins to connect customers with the specific products they purchased.

Aggregations: GROUP BY and SUM functions to generate monthly revenue reports.
