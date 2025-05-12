-- 
-- This query summarizes the number of applicants in each risk category.
-- Risk categories are determined based on:
--   - Credit score < 650
--   - Debt-to-income ratio > 0.4
--   - Previous loan defaults > 0
--   - Loan-to-value ratio > 0.9 (if assets are present)
-- Applicants with 2 or more risk factors are 'High Risk',
-- with 1 risk factor are 'Medium Risk', and with none are 'Low Risk'.
--

SELECT 
    overall_risk_category,           -- The assigned risk category (High, Medium, Low)
    COUNT(*) AS applicant_count      -- Number of applicants in this category
FROM (
    SELECT 
        applicant_id,
        credit_score,
        debt_to_income_ratio,
        assets_value,
        loan_amount,
        previous_defaults,
        -- Calculate loan-to-value ratio
        CASE 
            WHEN assets_value IS NOT NULL AND assets_value > 0 THEN ROUND(loan_amount / assets_value, 2)
            ELSE NULL
        END AS loan_to_value_ratio,
        -- Calculate risk score based on risk factors
        (
            (CASE WHEN credit_score < 650 THEN 1 ELSE 0 END) +
            (CASE WHEN debt_to_income_ratio > 0.4 THEN 1 ELSE 0 END) +
            (CASE WHEN previous_defaults > 0 THEN 1 ELSE 0 END) +
            (CASE WHEN assets_value IS NOT NULL AND assets_value > 0 AND (loan_amount / assets_value) > 0.9 THEN 1 ELSE 0 END)
        ) AS risk_score,
        -- Assign risk category
        CASE
            WHEN 
                ( (CASE WHEN credit_score < 650 THEN 1 ELSE 0 END) +
                  (CASE WHEN debt_to_income_ratio > 0.4 THEN 1 ELSE 0 END) +
                  (CASE WHEN previous_defaults > 0 THEN 1 ELSE 0 END) +
                  (CASE WHEN assets_value IS NOT NULL AND assets_value > 0 AND (loan_amount / assets_value) > 0.9 THEN 1 ELSE 0 END)
                ) >= 2 THEN 'High Risk'
            WHEN 
                ( (CASE WHEN credit_score < 650 THEN 1 ELSE 0 END) +
                  (CASE WHEN debt_to_income_ratio > 0.4 THEN 1 ELSE 0 END) +
                  (CASE WHEN previous_defaults > 0 THEN 1 ELSE 0 END) +
                  (CASE WHEN assets_value IS NOT NULL AND assets_value > 0 AND (loan_amount / assets_value) > 0.9 THEN 1 ELSE 0 END)
                ) = 1 THEN 'Medium Risk'
            ELSE 'Low Risk'
        END AS overall_risk_category
    FROM 
        loan_applicants
) AS risk_data
GROUP BY overall_risk_category;
