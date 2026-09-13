SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percent
FROM churn_status;


SELECT
    b.contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN cs.churn THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN cs.churn THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percent
FROM billing b
JOIN churn_status cs
    ON b.customer_id = cs.customer_id
GROUP BY b.contract
ORDER BY churn_rate_percent DESC;

SELECT
    s.internet_service,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN cs.churn THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN cs.churn THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percent
FROM services s
JOIN churn_status cs
    ON s.customer_id = cs.customer_id
GROUP BY s.internet_service
ORDER BY churn_rate_percent DESC;

SELECT
    CASE
        WHEN c.tenure <= 6 THEN '0-6 months'
        WHEN c.tenure <= 12 THEN '7-12 months'
        WHEN c.tenure <= 24 THEN '13-24 months'
        WHEN c.tenure <= 48 THEN '25-48 months'
        ELSE '49+ months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN cs.churn THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN cs.churn THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percent
FROM customer c
JOIN churn_status cs
    ON c.customer_id = cs.customer_id
GROUP BY tenure_group
ORDER BY MIN(c.tenure);

