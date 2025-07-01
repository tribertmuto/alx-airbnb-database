-- partitioning.sql

-- Step 1: Create a partitioned version of the Booking table
CREATE TABLE Booking_partitioned (
    booking_id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE NOT NULL,
    end_date DATE,
    payment_status VARCHAR(20)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions (e.g., by year)
CREATE TABLE Booking_2022 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE Booking_2023 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3 (Optional): Copy data from the original Booking table
-- INSERT INTO Booking_partitioned (booking_id, user_id, property_id, start_date, end_date, payment_status)
-- SELECT booking_id, user_id, property_id, start_date, end_date, payment_status FROM Booking;
