# Database Normalization – Airbnb Clone

## Objective
Ensure the database design is in **Third Normal Form (3NF)** by removing redundancies, avoiding partial dependencies, and ensuring all attributes depend only on the primary key.

---

## Step 1: First Normal Form (1NF)
**Requirement:** 
- Eliminate repeating groups.
- Ensure atomic values in each field.

**Review:**
- All attributes (e.g., `first_name`, `last_name`, `email`, `pricepernight`) are atomic.
- No multi-valued attributes (e.g., phone numbers stored separately per user).
- Each table has a primary key.

✅ Schema satisfies 1NF.

---

## Step 2: Second Normal Form (2NF)
**Requirement:** 
- Must already be in 1NF.
- Eliminate partial dependencies (no attribute depends on only part of a composite key).

**Review:**
- All tables use **single-column primary keys** (`UUID`), not composite keys.
- Attributes in each entity depend fully on the primary key.

✅ Schema satisfies 2NF.

---

## Step 3: Third Normal Form (3NF)
**Requirement:** 
- Must already be in 2NF.
- Eliminate transitive dependencies (non-key attributes should not depend on other non-key attributes).

**Review & Adjustments:**

1. **User Table**
   - `email`, `phone_number`, `role` all depend directly on `user_id`.  
   - No transitive dependencies.  
   ✅ Already in 3NF.

2. **Property Table**
   - `host_id` is a foreign key referencing `User`.
   - All descriptive attributes (`name`, `description`, `location`, `pricepernight`) depend only on `property_id`.  
   ✅ Already in 3NF.

3. **Booking Table**
   - `total_price` could be considered **derived** from `(end_date - start_date) * property.pricepernight`.  
   - To strictly follow 3NF, **derived attributes should be avoided**.  
   - Suggested adjustment: **remove `total_price`** from the table and compute it on demand.  
   - Alternatively, keep it for performance reasons, but document that it violates strict 3NF.

4. **Payment Table**
   - All fields (`amount`, `payment_date`, `payment_method`) depend only on `payment_id`.  
   - No transitive dependencies.  
   ✅ Already in 3NF.

5. **Review Table**
   - `rating` and `comment` depend on `review_id`.  
   - No transitive dependencies.  
   ✅ Already in 3NF.

6. **Message Table**
   - `message_body`, `sent_at` depend on `message_id`.  
   - No transitive dependencies.  
   ✅ Already in 3NF.

---

## Final Notes
- The schema is normalized to **3NF**.
- Only adjustment: consider removing `total_price` from **Booking** to avoid redundancy.  
  - If performance is prioritized, it may remain as a **denormalized field**, with documentation.

---

## Conclusion
The Airbnb database design adheres to **3NF principles**, with one minor note regarding `total_price`. The schema is efficient, free from anomalies, and avoids redundancy.
