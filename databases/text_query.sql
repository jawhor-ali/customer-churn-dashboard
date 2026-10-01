-- -- Churn Breakdown by Contract Length & Subscription Type
-- SELECT 
--     sub.subscription_type,
--     sub.contract_length,
--     COUNT(f.customer_id) AS total_customers,
--     ROUND(AVG(f.total_spend)::numeric, 2) AS avg_spend,
--     ROUND(AVG(f.churn::int) * 100, 2) AS churn_rate_percentage
-- FROM fact_customer_churn f
-- JOIN dim_subscription sub 
--     ON f.subscription_id = sub.subscription_id
-- GROUP BY sub.subscription_type, sub.contract_length;

-- =========
-- High-Risk Customer Identification

-- SELECT 
--     f.customer_id,
--     sub.subscription_type,
--     f.payment_delay,
--     f.support_calls,
--     f.total_spend
-- FROM fact_customer_churn f
-- JOIN dim_subscription sub 
--     ON f.subscription_id = sub.subscription_id
-- WHERE f.payment_delay > 15 
--   AND f.support_calls > 4
-- ORDER BY f.total_spend DESC;


-- -- Query 3: Rolling Metrics & Trends (Using Window Functions)

-- SELECT 
--     f.customer_id,
--     sub.subscription_type,
--     f.total_spend,
--     -- Rank customers by spend within their specific subscription type
--     RANK() OVER (PARTITION BY sub.subscription_type ORDER BY f.total_spend DESC) as spend_rank_in_plan,
--     -- Compare a customer's spend to the previous customer's spend in the ordered list
--     LAG(f.total_spend, 1) OVER (PARTITION BY sub.subscription_type ORDER BY f.total_spend DESC) as prev_customer_spend
-- FROM fact_customer_churn f
-- JOIN dim_subscription sub 
--     ON f.subscription_id = sub.subscription_id;


