-- ========================================
-- partitioning.sql
-- Partition the Booking table by start_date (range partitioning)
-- ========================================

-- 1. Create a new partitioned table
CREATE TABLE Booking_Partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    -- Add other columns if exist
    CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES User(id),
    CONSTRAINT fk_property FOREIGN KEY(property_id) REFERENCES Property(id)
) PARTITION BY RANGE (start_date);

-- 2. Create partitions for each year (example: 2024, 2025, 2026)
CREATE TABLE Booking_2024 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE Booking_2026 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

-- 3. Optional: Create indexes on each partition to improve query performance
CREATE INDEX idx_booking_2024_start_date ON Booking_2024(start_date);
CREATE INDEX idx_booking_2025_start_date ON Booking_2025(start_date);
CREATE INDEX idx_booking_2026_start_date ON Booking_2026(start_date);

-- 4. Test query performance: Fetch bookings within a date range
EXPLAIN ANALYZE
SELECT *
FROM Booking_Partitioned
WHERE start_date BETWEEN '2025-03-01' AND '2025-03-31';
