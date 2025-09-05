-- ========================================
-- Indexes for User table
-- ========================================

CREATE UNIQUE INDEX idx_user_email
ON User(email);

CREATE UNIQUE INDEX idx_user_username
ON User(username);

-- ========================================
-- Indexes for Booking table
-- ========================================

CREATE INDEX idx_booking_user_id
ON Booking(user_id);

CREATE INDEX idx_booking_property_id
ON Booking(property_id);

CREATE INDEX idx_booking_start_date
ON Booking(start_date);

-- ========================================
-- Indexes for Property table
-- ========================================

CREATE INDEX idx_property_city
ON Property(city);

CREATE INDEX idx_property_host_id
ON Property(host_id);

CREATE INDEX idx_property_price
ON Property(price);

-- Optional composite index for queries filtering by city and ordering by price
-- CREATE INDEX idx_property_city_price
-- ON Property(city, price);
-- ========================================
-- Measure query performance BEFORE indexes
-- ========================================

-- Booking by user_id
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 123;

-- Property by city
EXPLAIN ANALYZE
SELECT * FROM Property WHERE city = 'Addis Ababa';

-- User by email
EXPLAIN ANALYZE
SELECT * FROM User WHERE email = 'user@example.com';

-- Property ordered by price in a city
EXPLAIN ANALYZE
SELECT * FROM Property WHERE city = 'Addis Ababa' ORDER BY price;

-- ========================================
-- Apply indexes from database_index.sql
-- ========================================
-- \i database_index.sql  -- Run this manually in your SQL client

-- ========================================
-- Measure query performance AFTER indexes
-- ========================================

EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 123;

EXPLAIN ANALYZE
SELECT * FROM Property WHERE city = 'Addis Ababa';

EXPLAIN ANALYZE
SELECT * FROM User WHERE email = 'user@example.com';

EXPLAIN ANALYZE
SELECT * FROM Property WHERE city = 'Addis Ababa' ORDER BY price;
