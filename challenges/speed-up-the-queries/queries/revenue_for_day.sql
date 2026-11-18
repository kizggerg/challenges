-- The finance dashboard: paid orders and revenue for one day (UTC).
-- FIX: make created_at::date immutable so it can correctly use the index
SELECT count(*) AS orders, coalesce(sum(total_cents), 0) AS revenue_cents
FROM orders
WHERE ((created_at AT TIME ZONE 'UTC')::date) = $1
  AND status = 'paid';
