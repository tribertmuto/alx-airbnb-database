-- Step 1: Get total bookings per user
-- Step 2: Get total bookings and rank per property
-- Combine results in one query

WITH PropertyBookings AS (
    SELECT
        property_id,
        COUNT(*) AS total_bookings_per_property,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
    FROM bookings
    GROUP BY property_id
),
UserBookings AS (
    SELECT
        user_id,
        COUNT(*) AS total_bookings_per_user
    FROM bookings
    GROUP BY user_id
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
ORDER BY ub.user_id, pb.booking_rank;
