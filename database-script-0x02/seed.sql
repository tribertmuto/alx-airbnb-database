INSERT INTO User (name, email, password, phone_number)
VALUES ('Alice', 'alice@example.com', 'hashed_password', '1234567890');

INSERT INTO Property (user_id, name, description, location, price_per_night, max_guests)
VALUES (1, 'Beach House', 'Oceanfront property', 'Miami, FL', 250.00, 6);

INSERT INTO Booking (user_id, property_id, start_date, end_date, total_price)
VALUES (1, 1, '2025-07-01', '2025-07-07', 1500.00);
