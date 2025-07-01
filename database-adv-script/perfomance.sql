-- Step 1: Create indexes to optimize JOIN performance
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_payment_id ON bookings(payment_id);

-- Step 2: Retrieve all bookings with user, property, and payment details
SELECT 
    b.id AS booking_id,
    b.booking_date,
    
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    
    p.id AS property_id,
    p.name AS property_name,
    p.location AS property_location,
    
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.method

FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
INNER JOIN payments pay ON b.payment_id = pay.id;

-- Step 3: Use EXPLAIN to analyze the performance of the query
EXPLAIN SELECT 
    b.id AS booking_id,
    b.booking_date,
    
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    
    p.id AS property_id,
    p.name AS property_name,
    p.location AS property_location,
    
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.method

FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
INNER JOIN payments pay ON b.payment_id = pay.id;
