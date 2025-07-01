WITH UserBookings AS (
    SELECT
        user_id,
        COUNT(*) AS total_bookings_per_user
    FROM bookings
    GROUP BY user_id
),
PropertyBookings AS (
    SELECT
        property_id,
        COUNT(*) AS total_bookings_per_property,
        ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
    FROM bookings
    GROUP BY property_id
)

SELECT
    ub.user_id,
    ub.total_bookings_per_user,
    pb.property_id,
    pb.total_bookings_per_property,
    pb.booking_rank
FROM bookings b
JOIN UserBookings ub ON b.user_id = ub.user_id
JOIN PropertyBookings pb ON b.property_id = pb.property_id
GROUP BY
    ub.user_id,
    ub.total_bookings_per_user,
    pb.property_id,
    pb.total_bookings_per_property,
    pb.booking_rank
ORDER BY
    ub.user_id,
    pb.booking_rank;
SELECT
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM bookings
GROUP BY property_id;
-- Total bookings per user
SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;

-- Rank properties based on total bookings using RANK()
SELECT
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM bookings
GROUP BY property_id;
-- Total bookings per user
SELECT 
    user_id, 
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;

-- Rank properties by total bookings using RANK()
SELECT
    property_id,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
    SELECT 
        property_id,
        COUNT(*) AS total_bookings
    FROM bookings
    GROUP BY property_id
) AS property_counts;
