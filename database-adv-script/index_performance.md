# Database Index Optimization

## Objective
Improve query performance on the `User`, `Booking`, and `Property` tables by identifying high-usage columns and creating appropriate indexes.

---

## Step 1: Identify High-Usage Columns

Columns frequently used in `WHERE`, `JOIN`, or `ORDER BY` clauses:

### User Table
- `id` (JOIN)
- `email` (WHERE)

### Booking Table
- `user_id` (JOIN)
- `property_id` (JOIN)
- `created_at` (WHERE, ORDER BY)

### Property Table
- `id` (JOIN)
- `location` (WHERE)
- `price` (WHERE, ORDER BY)

---

## Step 2: Create Indexes

Index creation commands are saved in [`database_index.sql`](./database_index.sql):

```sql
-- User table
CREATE INDEX idx_user_id ON User(id);
CREATE INDEX idx_user_email ON User(email);

-- Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_created_at ON Booking(created_at);

-- Property table
CREATE INDEX idx_property_id ON Property(id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price);
