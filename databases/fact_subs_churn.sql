CREATE TABLE fact_customer_churn (
    customer_id INT,               -- Foreign key linking to dim_customer
    subscription_id INT,           -- Foreign key linking to dim_subscription
    tenure INT,
    usage_frequency INT,
    support_calls INT,
    payment_delay INT,             -- (Note: match lowercase/uppercase styling)
    total_spend NUMERIC(10,2),
    last_interaction INT,          -- (Note: matches your original staging column name)
    churn INT
);