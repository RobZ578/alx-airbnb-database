# Booking Table Partitioning Report

## 1. Objective
Implement partitioning on the Booking table based on `start_date` to improve query performance on large datasets.

---

## 2. Partitioning Strategy
- Table `Booking_Partitioned` created with **RANGE partitioning** on `start_date`.
- Partitions created for years 2024, 2025, 2026.
- Indexes added on `start_date` for each partition.

---

## 3. Test Queries
Example: Fetch bookings for March 2025

```sql
SELECT *
FROM Booking_Partitioned
WHERE start_date BETWEEN '2025-03-01' AND '2025-03-31';
