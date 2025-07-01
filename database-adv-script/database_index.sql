-- Indexes for User table
CREATE INDEX idx_user_id ON User(id);
CREATE INDEX idx_user_email ON User(email);

-- Indexes for Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_date ON Booking(booking_date);

-- Indexes for Property table
CREATE INDEX idx_property_id ON Property(id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price);
-- Without indexes:
EXPLAIN ANALYZE
SELECT u.name, b.booking_date, p.location
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
WHERE p.location = 'Kigali'
ORDER BY b.booking_date DESC;