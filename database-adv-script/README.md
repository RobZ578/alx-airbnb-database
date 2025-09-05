# SQL Joins – Airbnb Database

This directory contains advanced SQL queries that demonstrate how to use different types of joins in the **Airbnb Clone Database**.

## 📌 Queries Included

1. **INNER JOIN**
   - Retrieves all bookings along with the users who made those bookings.
   - Ensures only users with actual bookings are included.

2. **LEFT JOIN**
   - Retrieves all properties and their reviews.
   - Includes properties that don’t have any reviews.

3. **FULL OUTER JOIN**
   - Retrieves all users and all bookings.
   - Ensures no user or booking is left out, even if there’s no match.

## 📂 Files
- `joins_queries.sql` → Contains the SQL queries.
- `README.md` → Explains the objective and details of the queries.

## 🚀 How to Run
1. Connect to your PostgreSQL/MySQL database.
2. Load the Airbnb schema with tables: **users, bookings, properties, reviews**.
3. Run the queries in `joins_queries.sql`.
