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
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_booking_payment_id ON bookings(payment_id);
SELECT
    b.booking_id,
    b.booking_date,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount,
    pay.payment_date
FROM
    bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.payment_id = pay.payment_id;
