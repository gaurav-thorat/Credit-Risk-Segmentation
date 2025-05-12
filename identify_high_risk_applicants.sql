-- List applicants who are high risk based on credit score, DTI, or past defaults
SELECT 
    applicant_id,
    age,
    gender,
    income,
    credit_score,
    debt_to_income_ratio,
    previous_defaults,
    risk_rating
FROM 
    loan_applicants
WHERE 
    credit_score < 650
    OR debt_to_income_ratio > 0.4
    OR previous_defaults > 0;