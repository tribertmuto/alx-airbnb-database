# Property Booking System - Entity Relationship Overview

This document provides a high-level overview of the core data model for a property booking system, including entities, their attributes, and relationships.



# Entities and Attributes

# 1. User
Represents a person using the platform (either guest or host).

- `user_id` (PK): Unique identifier
- `name`: Full name of the user
- `email`: Email address
- `password_hash`: Encrypted password
- `phone_number`: Contact number
- `user_type`: Enum ("guest", "host", "admin")
- `date_joined`: Account creation date
- `profile_picture_url`: Link to profile image

---

# 2. Property
Represents a property listed by a host for booking.

- `property_id` (PK): Unique identifier
- `host_id` (FK): References `User(user_id)`
- `title`: Name of the property
- `description`: Detailed description
- `address`: Full address
- `city`: City of the property
- `country`: Country
- `price_per_night`: Nightly rate
- `max_guests`: Maximum number of guests allowed
- `num_bedrooms`: Number of bedrooms
- `num_bathrooms`: Number of bathrooms
- `amenities`: List of amenities (Wi-Fi, Kitchen, etc.)
- `property_type`: Enum ("apartment", "house", etc.)
- `created_at`: Date listed
- `is_active`: Boolean (active/inactive listing)

---

# 3. Booking
Represents a reservation made by a guest for a property.

- `booking_id` (PK): Unique identifier
- `guest_id` (FK): References `User(user_id)`
- `property_id` (FK): References `Property(property_id)`
- `check_in`: Check-in date
- `check_out`: Check-out date
- `num_guests`: Number of guests
- `total_price`: Total cost of booking
- `booking_status`: Enum ("pending", "confirmed", "cancelled", "completed")
- `created_at`: Timestamp of booking creation

---

# 4. Review
Represents a review left by a guest after staying at a property.

- `review_id` (PK): Unique identifier
- `booking_id` (FK): References `Booking(booking_id)`
- `guest_id` (FK): References `User(user_id)`
- `property_id` (FK): References `Property(property_id)`
- `rating`: Numeric score (1 to 5)
- `comment`: Optional feedback
- `created_at`: Timestamp of review submission

# 5. Payment
Represents a payment transaction for a booking.

- `payment_id` (PK): Unique identifier
- `booking_id` (FK): References `Booking(booking_id)`
- `user_id` (FK): References `User(user_id)`
- `amount`: Total paid
- `payment_method`: Enum ("credit_card", "paypal", etc.)
- `payment_status`: Enum ("pending", "completed", "failed", "refunded")
- `payment_date`: Timestamp of payment

---

# Entity Relationships

- User (1) ⟶ Property: A host can list multiple properties.
- User (1) ⟶ (∞) Booking: A guest can make multiple bookings.
- Property (1) ⟶ (∞) Booking: A property can be booked many times.
- Booking (1) ⟶ (1) Property: Each booking is for one property.
- Booking (1) ⟶ (1) Guest (User): Each booking is made by one guest.
- Booking (1) ⟶ (1) Payment: Each booking has one payment.
- Booking (1) ⟶ (1) Review: Each booking can result in one review.
- User (1) ⟶ (∞) Review: A guest can leave multiple reviews.
- Property (1) ⟶ (∞) Review: A property can have multiple reviews.



# Notes

- This model supports both guests and hosts under the same `User` entity with a `user_type` field.
- Payments and reviews are tied to specific bookings for traceability.
- Amenity data may optionally be modeled as a separate table with many-to-many relationships if needed.

---

# ER Diagram (Optional for Visual Tools)

https://www.mermaidchart.com/app/projects/5e68dbcc-6191-469e-8502-522d5e389daf/diagrams/c1f95e77-4577-4bc6-9ab9-25a8f3657846/version/v0.1/edit

