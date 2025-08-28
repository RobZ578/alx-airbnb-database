-- Airbnb Clone Database Seed Data
-- Filename: seed.sql

-- ============================
-- Users
-- ============================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hash1', '555-0101', 'guest'),
  (gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hash2', '555-0102', 'guest'),
  (gen_random_uuid(), 'Charlie', 'Brown', 'charlie@example.com', 'hash3', '555-0103', 'host'),
  (gen_random_uuid(), 'Diana', 'Prince', 'diana@example.com', 'hash4', '555-0104', 'host'),
  (gen_random_uuid(), 'Eve', 'Adams', 'eve@example.com', 'hash5', '555-0105', 'admin');

-- ============================
-- Properties
-- ============================
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES
  (gen_random_uuid(), (SELECT user_id FROM users WHERE first_name='Charlie'), 'Cozy Apartment', 'A nice cozy apartment in downtown.', 'New York', 120.00),
  (gen_random_uuid(), (SELECT user_id FROM users WHERE first_name='Charlie'), 'Beach House', 'Spacious house near the beach.', 'Miami', 250.00),
  (gen_random_uuid(), (SELECT user_id FROM users WHERE first_name='Diana'), 'Mountain Cabin', 'Rustic cabin in the mountains.', 'Denver', 180.00),
  (gen_random_uuid(), (SELECT user_id FROM users WHERE first_name='Diana'), 'City Loft', 'Modern loft in city center.', 'San Francisco', 200.00);

-- ============================
-- Bookings
-- ============================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (gen_random_uuid(), (SELECT property_id FROM properties WHERE name='Cozy Apartment'), (SELECT user_id FROM users WHERE first_name='Alice'), '2025-09-01', '2025-09-05', 480.00, 'confirmed'),
  (gen_random_uuid(), (SELECT property_id FROM properties WHERE name='Beach House'), (SELECT user_id FROM users WHERE first_name='Bob'), '2025-10-10', '2025-10-15', 1250.00, 'pending'),
  (gen_random_uuid(), (SELECT property_id FROM properties WHERE name='City Loft'), (SELECT user_id FROM users WHERE first_name='Alice'), '2025-11-05', '2025-11-10', 1000.00, 'confirmed');

-- ============================
-- Payments
-- ============================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  (gen_random_uuid(), (SELECT booking_id FROM bookings WHERE status='confirmed' LIMIT 1), 480.00, 'credit_card'),
  (gen_random_uuid(), (SELECT booking_id FROM bookings WHERE status='confirmed' OFFSET 1 LIMIT 1), 1000.00, 'paypal');

-- ============================
-- Reviews
-- ============================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
  (gen_random_uuid(), (SELECT property_id FROM properties WHERE name='Cozy Apartment'), (SELECT user_id FROM users WHERE first_name='Alice'), 5, 'Amazing stay, very cozy!'),
  (gen_random_uuid(), (SELECT property_id FROM properties WHERE name='City Loft'), (SELECT user_id FROM users WHERE first_name='Alice'), 4, 'Great location, modern loft.');

-- ============================
-- Messages
-- ============================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
  (gen_random_uuid(), (SELECT user_id FROM users WHERE first_name='Alice'), (SELECT user_id FROM users WHERE first_name='Charlie'), 'Hi, excited about my upcoming stay!'),
  (gen_random_uuid(), (SELECT user_id FROM users WHERE first_name='Bob'), (SELECT user_id FROM users WHERE first_name='Charlie'), 'Can I extend my booking?');
