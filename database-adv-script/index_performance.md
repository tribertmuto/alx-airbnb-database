# Database Index Optimization

## Objective
Improve query performance on the `User`, `Booking`, and `Property` tables by identifying high-usage columns and creating appropriate indexes.

---

## Step 1: Identify High-Usage Columns

Columns frequently used in `WHERE`, `JOIN`, or `ORDER BY` clauses:

### User Table
- id` (JOIN)
- email` (WHERE)

### Booking Table
- user_id` (JOIN)
- property_id` (JOIN)
- created_at` (WHERE, ORDER BY)

### Property Table
- id` (JOIN)
- location` (WHERE)
- price` (WHERE, ORDER BY)