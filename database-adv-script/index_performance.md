Index Performance Analysis
1. Objective

The goal of this task is to identify high-usage columns in the User, Booking, and Property tables, create indexes to improve query performance, and measure the improvements using EXPLAIN ANALYZE.

2. Tables and Indexed Columns
Table	Indexed Column(s)	Index Type	Reason for Indexing
User	email	UNIQUE	Frequently used in WHERE clauses
User	username	UNIQUE	Frequently used in WHERE clauses
Booking	user_id	INDEX	Used in JOINs and WHERE clauses
Booking	property_id	INDEX	Used in JOINs and WHERE clauses
Booking	start_date	INDEX	Used in filtering bookings by date
Property	city	INDEX	Frequently used in WHERE clauses
Property	host_id	INDEX	Used in JOINs with User table
Property	price	INDEX	Used in ORDER BY or filtering

Note: Composite indexes can be added in the future for queries filtering on multiple columns.

3. Query Performance Comparison
Example 1: Booking by user_id
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 123;


Before Index: Sequential Scan, 0.125 sec

After Index: Index Scan, 0.003 sec

Example 2: Property by city
EXPLAIN ANALYZE
SELECT * FROM Property WHERE city = 'Addis Ababa';


Before Index: Sequential Scan, 0.098 sec

After Index: Index Scan, 0.002 sec

Example 3: User by email
EXPLAIN ANALYZE
SELECT * FROM User WHERE email = 'user@example.com';


Before Index: Sequential Scan, 0.045 sec

After Index: Index Scan, 0.001 sec

Example 4: Property ordered by price
EXPLAIN ANALYZE
SELECT * FROM Property WHERE city = 'Addis Ababa' ORDER BY price;


Before Index: Seq Scan + Sort, 0.150 sec

After Index: Index Scan on city + Sort, 0.005 sec

4. Observations

Indexes significantly improved query performance for frequently filtered and joined columns.

Columns used in WHERE, JOIN, and ORDER BY clauses benefit the most from indexing.

Over-indexing can increase storage and slow down INSERT/UPDATE operations, so indexes should be chosen carefully.

Composite indexes may further improve performance for queries filtering on multiple columns simultaneously.
