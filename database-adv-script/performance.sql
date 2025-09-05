-- ========================================
-- performance.sql
-- Query performance analysis for Booking + User + Property + Payment
-- ========================================

-- ========================================
-- 1. Initial Query (Before Optimization)
-- ========================================

-- Measure performance of the initial query
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.title AS property_title,
    p.city AS property_city,
    p.price AS property_price,
    pay.id AS payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id;

-- ========================================
-- 2. Refactored Query (After Optimization)
-- ========================================

-- Optional: Create indexes to support the optimized query
-- Uncomment and execute if indexes do not already exist
-- CREATE INDEX idx_booking_user_id ON Booking(user_id);
-- CREATE INDEX idx_booking_property_id ON Booking(property_id);
-- CREATE INDEX idx_booking_status ON Booking(status);
-- CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- Measure performance of the optimized query
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.title AS property_title,
    p.city AS property_city,
    p.price AS property_price,
    pay.id AS payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id
WHERE b.status = 'confirmed';
