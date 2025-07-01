-- Emulated FULL OUTER JOIN (for MySQL)
SELECT 
    users.user_id,
    users.name,
    bookings.booking_id,
    bookings.property_id,
    bookings.booking_date
FROM 
    users
LEFT JOIN 
    bookings ON users.user_id = bookings.user_id

UNION

SELECT 
    users.user_id,
    users.name,
    bookings.booking_id,
    bookings.property_id,
    bookings.booking_date
FROM 
    bookings
LEFT JOIN 
    users ON users.user_id = bookings.user_id;
