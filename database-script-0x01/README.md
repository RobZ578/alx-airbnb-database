# Database Schema – Airbnb Clone

## 📌 Overview
This directory contains the **SQL schema** for the Airbnb Clone project.  
It defines the database structure, including tables, relationships, constraints, and indexes.

## 📂 Files
- `schema.sql` → SQL script for creating the database schema.
- `README.md` → Documentation for the schema.

## 🗄️ Entities & Relationships
- **Users** → Stores guest, host, and admin information.
- **Properties** → Listings created by hosts.
- **Bookings** → Reservations made by users on properties.
- **Payments** → Transactions linked to bookings.
- **Reviews** → User feedback on properties.
- **Messages** → Communication between users.

## ⚙️ Instructions
1. Connect to your PostgreSQL database:
   ```bash
   psql -U <username> -d <database>
2. Run the schema script:
   \i schema.sql
   
4. Verify that tables were created:
   \dt

📑 Notes

Uses UUID as primary keys for scalability.

Indexes added for performance (email, property_id, booking_id, etc.).

Constraints ensure data integrity:

Foreign keys with cascading deletes.

Check constraints for role, status, payment_method, and rating.
