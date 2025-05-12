-- Show DTI and categorize risk based on DTI
SELECT 
    applicant_id,
    income,
    loan_amount,
    debt_to_income_ratio,
    CASE
        WHEN debt_to_income_ratio < 0.2 THEN 'Low DTI Risk'
        WHEN debt_to_income_ratio BETWEEN 0.2 AND 0.4 THEN 'Medium DTI Risk'
        ELSE 'High DTI Risk'
    END AS dti_risk_category
FROM 
    loan_applicants
ORDER BY debt_to_income_ratio DESC;