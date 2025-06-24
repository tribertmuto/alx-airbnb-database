CREATE TABLE User (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Property (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES User(id) ON DELETE CASCADE,
    name VARCHAR(100),
    description TEXT,
    location VARCHAR(200),
    price_per_night NUMERIC(10, 2),
    max_guests INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Continue for Booking, Payment, Review, etc.
