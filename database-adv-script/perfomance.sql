-- Step 1: Create helpful indexes to optimize joins
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_payment_id ON bookings(payment_id);

-- Step 2: Main Query - Retrieve all bookings with user, property, and payment details
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

-- Step 3: Analyze performance of the above query
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
