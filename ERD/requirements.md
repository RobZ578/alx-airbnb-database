# Airbnb Database ERD Requirements

## Entities
- **User**
  - Attributes: user_id, first_name, last_name, email, password_hash, phone_number, role, created_at
- **Property**
  - Attributes: property_id, host_id, name, description, location, pricepernight, created_at, updated_at
- **Booking**
  - Attributes: booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
- **Payment**
  - Attributes: payment_id, booking_id, amount, payment_date, payment_method
- **Review**
  - Attributes: review_id, property_id, user_id, rating, comment, created_at
- **Message**
  - Attributes: message_id, sender_id, recipient_id, message_body, sent_at

## Relationships
- A User can host many Properties.
- A User can book many Properties through Bookings.
- A Property can have many Bookings.
- A Booking can have one or more Payments.
- A Property can have many Reviews from Users.
- A User can send and receive many Messages from other Users.

## Constraints
- Unique email per User.
- Booking status limited to (pending, confirmed, canceled).
- Review rating must be between 1–5.
- Foreign key constraints for host_id, property_id, user_id, booking_id, sender_id, recipient_id.

## Indexing
- Primary keys are indexed automatically.
- Additional indexes:
  - User.email
  - Property.property_id
  - Booking.property_id, Booking.booking_id
  - Payment.booking_id
