-- Aggregation: total number of bookings made by each user
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b 
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC, u.user_id;

-- Window functions: rank properties by total bookings
-- Use a CTE to aggregate first, then apply ROW_NUMBER() / RANK()
WITH property_counts AS (
    SELECT 
        p.property_id,
        p.title,
        COUNT(b.booking_id) AS total_bookings
    FROM properties p
    LEFT JOIN bookings b 
        ON p.property_id = b.property_id
    GROUP BY p.property_id, p.title
)
SELECT
    property_counts.property_id,
    property_counts.title,
    property_counts.total_bookings,
    ROW_NUMBER() OVER (ORDER BY property_counts.total_bookings DESC, property_counts.property_id) AS booking_row_number,
    RANK()       OVER (ORDER BY property_counts.total_bookings DESC, property_counts.property_id) AS booking_rank
FROM property_counts
ORDER BY booking_row_number;
