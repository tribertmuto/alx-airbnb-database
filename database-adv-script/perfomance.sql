-- File: perfomance.sql

-- Optimized query: retrieves all bookings along with user, property, and payment details
-- Payment join is now LEFT JOIN to ensure all bookings are shown, even without a payment

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

-- EXPLAIN ANALYZE to assess performance and detect inefficiencies
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

-- Indexing recommendations to improve performance (run separately in psql or MySQL)
-- CREATE INDEX idx_bookings_user_id ON bookings(user_id);
-- CREATE INDEX idx_bookings_property_id ON bookings(property_id);
-- CREATE INDEX idx_payments_booking_id ON payments(booking_id);
