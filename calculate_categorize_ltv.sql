-- Calculate LTV ratio and categorize risk (only for applicants with assets)
SELECT 
    applicant_id,
    loan_amount,
    assets_value,
    ROUND(loan_amount / assets_value, 2) AS loan_to_value_ratio,
    CASE
        WHEN assets_value IS NULL OR assets_value = 0 THEN 'N/A'
        WHEN (loan_amount / assets_value) <= 0.75 THEN 'Low LTV Risk'
        WHEN (loan_amount / assets_value) <= 0.9 THEN 'Medium LTV Risk'
        ELSE 'High LTV Risk'
    END AS ltv_risk_category
FROM 
    loan_applicants
WHERE 
    assets_value IS NOT NULL AND assets_value > 0;