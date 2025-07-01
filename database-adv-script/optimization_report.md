# Query Optimization Report

## 🔍 Initial Query Overview

The original SQL query retrieved all bookings along with user, property, and payment details:

```sql
SELECT
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name AS user_name,
    p.property_id,
    p.name AS property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM
    bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
INNER JOIN payments pay ON b.payment_id = pay.payment_id;
