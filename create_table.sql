-- Step 3: Create the loan_applicants table with column descriptions

CREATE TABLE IF NOT EXISTS loan_applicants (
    applicant_id INT PRIMARY KEY AUTO_INCREMENT,         -- Unique applicant ID
    age INT,                                             -- Age of the applicant
    gender VARCHAR(20),                                  -- Gender of the applicant
    education_level VARCHAR(50),                         -- Education level (e.g., Graduate, Postgraduate)
    marital_status VARCHAR(20),                          -- Marital status (e.g., Single, Married)
    income DECIMAL(12,2),                                -- Annual income of the applicant
    credit_score INT,                                    -- Credit score (e.g., CIBIL score)
    loan_amount DECIMAL(12,2),                           -- Amount of loan applied for
    loan_purpose VARCHAR(50),                            -- Purpose of the loan (e.g., Home, Car, Personal)
    employment_status VARCHAR(50),                       -- Employment status (e.g., Employed, Self-employed)
    years_at_current_job INT,                            -- Years at current job
    payment_history VARCHAR(20),                         -- Payment history (e.g., Good, Average, Poor)
    debt_to_income_ratio DECIMAL(6,3),                   -- Debt-to-Income ratio
    assets_value DECIMAL(12,2),                          -- Value of applicant's assets
    number_of_dependents INT,                            -- Number of dependents
    country VARCHAR(100),                                -- Country of residence
    previous_defaults INT,                               -- Number of previous loan defaults
    marital_status_change INT,                           -- Change in marital status (if tracked)
    risk_rating VARCHAR(20)                              -- Risk rating (e.g., High, Medium, Low)
);
