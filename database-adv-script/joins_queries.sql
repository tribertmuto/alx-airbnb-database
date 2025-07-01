-- 1. INNER JOIN: Get all bookings and their respective users
SELECT 
    b.booking_id,
    b.property_id,
    b.booking_date,
    u.user_id,
    u.username,
    u.email
FROM 
    Bookings b
INNER JOIN 
    Users u ON b.user_id = u.user_id;

-- 2. LEFT JOIN: Get all properties and their reviews, including properties with no reviews
SELECT 
    p.property_id,
    p.property_name,
    r.review_id,
    r.rating,
    r.comment
FROM 
    Properties p
LEFT JOIN 
    Reviews r ON p.property_id = r.property_id;

-- 3. FULL OUTER JOIN: Get all users and all bookings, even if no booking or no user match
SELECT 
    u.user_id,
    u.username,
    b.booking_id,
    b.property_id,
    b.booking_date
FROM 
    Users u
FULL OUTER JOIN 
    Bookings b ON u.user_id = b.user_id;
