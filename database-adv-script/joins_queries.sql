-- Query 1: INNER JOIN - Retrieve all bookings and the respective users who made those bookings
SELECT 
    bookings.booking_id,
    bookings.property_id,
    bookings.booking_date,
    users.user_id,
    users.name,
    users.email
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.user_id;


-- Query 2: LEFT JOIN - Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    properties.property_id,
    properties.property_name,
    reviews.review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.property_id = reviews.property_id
ORDER BY 
    properties.property_id,
    reviews.review_id;


-- Query 3: FULL OUTER JOIN - Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user

-- Use this if your DBMS supports FULL OUTER JOIN (e.g., SQL Server, PostgreSQL)
SELECT 
    users.user_id,
    users.name,
    bookings.booking_id,
    bookings.property_id,
    bookings.booking_date
FROM 
    users
FULL OUTER JOIN 
    bookings ON users.user_id = bookings.user_id;

-- Alternative for MySQL (emulated FULL OUTER JOIN using UNION)
-- Uncomment if using MySQL:

-- SELECT 
--     users.user_id,
--     users.name,
--     bookings.booking_id,
--     bookings.property_id,
--     bookings.booking_date
-- FROM 
--     users
-- LEFT JOIN 
--     bookings ON users.user_id = bookings.user_id

-- UNION

-- SELECT 
--     users.user_id,
--     users.name,
--     bookings.booking_id,
--     bookings.property_id,
--     bookings.booking_date
-- FROM 
--     bookings
-- LEFT JOIN 
--     users ON users.user_id = bookings.user_id;
