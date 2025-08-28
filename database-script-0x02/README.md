# Database Seeding – Airbnb Clone

## 📌 Overview
This directory contains SQL scripts to populate the Airbnb Clone database with **sample data**.  
The data simulates real-world usage with multiple users, properties, bookings, payments, reviews, and messages.

## 📂 Files
- `seed.sql` → SQL script containing `INSERT` statements for all tables.
- `README.md` → Documentation explaining the seed data.

## 🗄️ Sample Data Details
- **Users:** Hosts, guests, and an admin.
- **Properties:** Multiple listings per host.
- **Bookings:** Reservations linking guests to properties.
- **Payments:** Payments for confirmed bookings using multiple methods.
- **Reviews:** Ratings and comments from guests about properties.
- **Messages:** Communication between users to simulate conversation flow.

## ⚙️ Instructions
1. Ensure the **database schema** has been created (`schema.sql` from database-script-0x01).  
2. Connect to your PostgreSQL database:
   ```bash
   psql -U <username> -d <database>
Run the seed script:

bash
Copy code
\i seed.sql
Verify the data:

sql
Copy code
SELECT * FROM users;
SELECT * FROM properties;
SELECT * FROM bookings;
SELECT * FROM payments;
SELECT * FROM reviews;
SELECT * FROM messages;
📑 Notes
Passwords are sample hashes, not real encrypted passwords.

Bookings link guests to properties.

Payments are tied to confirmed bookings.

Messages illustrate user-to-user communication.

Data is designed for testing and demonstration purposes.

