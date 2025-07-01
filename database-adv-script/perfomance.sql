-- File: perfomance.sql

-- ✅ Query: Retrieves all bookings with user, property, and payment details
-- ✅ No WHERE or AND clauses
-- ✅ Uses LEFT JOIN for payments to include bookings with or without payment

SELECT
    b.booking_id,
    b.booking_date,
    b.status,
    u.user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.property_id,
    p.title AS property_title,
    p.location AS property_location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;

-- ✅ EXPLAIN ANALYZE to inspect performance without WHERE/AND filters
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.booking_date,
    b.status,
    u.user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.property_id,
    p.title AS property_title,
    p.location AS property_location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;

-- ✅ Index suggestions (run separately in your DB shell):
-- CREATE INDEX idx_bookings_user_id ON bookings(user_id);
-- CREATE INDEX idx_bookings_property_id ON bookings(property_id);
-- CREATE INDEX idx_payments_booking_id ON payments(booking_id);
-- CREATE INDEX idx_users_user_id ON users(user_id);