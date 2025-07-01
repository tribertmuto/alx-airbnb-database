SELECT DISTINCT p.id AS property_id, p.name AS property_name, u.id AS user_id, u.name AS user_name
FROM properties p
JOIN bookings b ON b.property_id = p.id
JOIN users u ON u.id = b.user_id
WHERE p.id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
)
AND (
    SELECT COUNT(*)
    FROM bookings b2
    WHERE b2.user_id = u.id
) > 3;
