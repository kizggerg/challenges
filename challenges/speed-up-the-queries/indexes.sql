-- Indexes for the shop database. The grader runs this file once, as the
-- app's database user, right after schema.sql, while the tables are empty.
CREATE INDEX orders_status_idx ON orders (status);

/* Fix 1: Orders History Page */
CREATE INDEX idx_orders_customer_id_by_created_at_by_id 
ON orders (customer_id, created_at DESC, id DESC)
INCLUDE (status, total_cents);

/* Fix 2: Login */
DROP INDEX customers_email_idx; 
CREATE INDEX idx_customers_email_lower ON customers (lower(email));

/* Fix 3: Dashboard */
CREATE INDEX idx_orders_status_by_created_date_where_status_paid 
ON orders (((created_at AT TIME ZONE 'UTC')::date))
WHERE status = 'paid';
