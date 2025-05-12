-- Assign a comprehensive risk category based on credit score, DTI, LTV, and defaults
SELECT 
    applicant_id,
    credit_score,
    debt_to_income_ratio,
    assets_value,
    loan_amount,
    previous_defaults,
    -- Calculate LTV ratio
    CASE 
        WHEN assets_value IS NOT NULL AND assets_value > 0 THEN ROUND(loan_amount / assets_value, 2)
        ELSE NULL
    END AS loan_to_value_ratio,
    -- Assign risk score
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
    loan_applicants;