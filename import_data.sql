-- Step 4: Import data from CSV file
-- Make sure the CSV file is in the secure-file-priv directory and column order matches the table

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/financial_risk_assessment.csv'
INTO TABLE loan_applicants
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    age, 
    gender, 
    education_level, 
    marital_status, 
    income, 
    credit_score, 
    loan_amount,
    loan_purpose, 
    employment_status, 
    years_at_current_job, 
    payment_history,
    debt_to_income_ratio, 
    assets_value, 
    number_of_dependents, 
    country,
    previous_defaults, 
    marital_status_change, 
    risk_rating
);
-- This command imports the data from the CSV file into the loan_applicants table.
-- Ensure the CSV columns are in the same order as listed above.