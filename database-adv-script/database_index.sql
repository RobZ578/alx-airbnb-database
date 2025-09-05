-- ========================================
-- Indexes for User table
-- ========================================

-- Unique index on email for faster lookup
CREATE UNIQUE INDEX idx_user_email
ON User(email);

-- Unique index on username for faster lookup
CREATE UNIQUE INDEX idx_user_username
ON User(username);

-- ========================================
-- Indexes for Booking table
-- ========================================

-- Index on user_id for JOINs and WHERE filtering
CREATE INDEX idx_booking_user_id
ON Booking(user_id);

-- Index on property_id for JOINs and WHERE filtering
CREATE INDEX idx_booking_property_id
ON Booking(property_id);

-- Index on start_date for date range queries
CREATE INDEX idx_booking_start_date
ON Booking(start_date);

-- ========================================
-- Indexes for Property table
-- ========================================

-- Index on city for WHERE filtering
CREATE INDEX idx_property_city
ON Property(city);

-- Index on host_id for JOINs with User table
CREATE INDEX idx_property_host_id
ON Property(host_id);

-- Index on price for ORDER BY and filtering
CREATE INDEX idx_property_price
ON Property(price);

-- Optional: Composite index for frequently queried city + price
-- Uncomment if queries often filter by city and order by price
-- CREATE INDEX idx_property_city_price
-- ON Property(city, price);
