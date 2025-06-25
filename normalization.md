# Database Normalization

# Objective

Apply normalization principles to ensure the database is in Third Normal Form (3NF). This process helps eliminate redundancy, improve data integrity, and create a more scalable and maintainable database schema.

# Instructions Followed

1. Reviewed the schema to identify redundant data and normalization violations.
2. Applied normalization principles (1NF, 2NF, 3NF) to refine the structure of each entity.
3. Adjusted relationships and table structures to meet the requirements of 3NF.
4. Documented the normalization steps and decisions below.

---

# Normalization Steps

# First Normal Form (1NF)

Requirement: Each table must have atomic values and no repeating groups.

Action Taken:
- Ensured all fields store only a single value (e.g., `location`, `email`, `price_per_night`).
- Removed any multi-valued fields (e.g., amenities are stored in a separate table linked by a many-to-many relationship using `PropertyAmenity`).

---

# Second Normal Form (2NF)

Requirement: All non-key attributes must be fully dependent on the whole primary key.

Action Taken:
- Eliminated partial dependencies in any composite-key tables.
- Booking table references a unique `id`, and all other fields depend only on that key.
- Extracted amenities into a separate table to ensure no partial dependency within property data.



# Third Normal Form (3NF)

Requirement: No non-key attribute should depend on another non-key attribute (eliminate transitive dependencies).

Action Taken:
- Moved payment details (amount, method) into a separate `Payment` table, linked to `Booking`.
- Ensured that review data (rating, comment) exists only in the `Review` table and is linked via `booking_id` and `user_id`.
- Removed derived or duplicative data such as storing total_price inside `Payment`, since it already exists in `Booking`.



# Outcome

After normalization, the database schema consists of the following entities:

- User
- Property
- Booking
- Payment
- Review
- Amenity
- PropertyAmenity (join table for many-to-many)

Each table:
- Has a single purpose
- Eliminates data redundancy
- Follows 3NF guidelines



# Benefits Achieved

- No redundant data across tables  
- Improved data integrity and consistency  
- Better performance and scalability for future growth  
- Clear relationships between entities

This ensures a strong foundation for building a reliable and extensible Airbnb-like platform.

