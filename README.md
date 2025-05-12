# Credit Risk Segmentation & Dashboarding (SQL & Excel)

## Overview

This project demonstrates a complete credit risk assessment workflow using SQL and Excel. The goal is to segment loan applicants into risk categories based on key financial metrics and visualize the results in an interactive Excel dashboard.

## Dataset

- **File:** credit_risk_segmentation.xlsx
- **Sheet:** ApplicantsData
- **Fields:**
  - `applicant_id`: Unique identifier for each applicant
  - `credit_score`: Credit score of the applicant
  - `debt_to_income_ratio`: Debt-to-income ratio
  - `assets_value`: Value of applicant's assets
  - `loan_amount`: Amount of loan applied for
  - `previous_defaults`: Number of previous loan defaults
  - `loan_to_value_ratio`: Loan amount divided by assets value
  - `risk_score`: Composite risk score based on multiple factors
  - `overall_risk_category`: Final risk category (Low, Medium, High)

## Workflow

### 1. Data Preparation (SQL)
- Imported and cleaned the dataset in MySQL.
- Calculated key ratios (DTI, LTV) and assigned risk scores and categories using SQL queries.

### 2. Data Export
- Exported analysis results (risk segmentation, DTI/LTV, summary stats) as CSV files for Excel.

### 3. Dashboarding (Excel)
- Imported CSVs into Excel and formatted as tables.
- Built KPI cards for total applicants, high-risk count, average credit score, and DTI.
- Created charts:
  - Pie/Donut chart for risk category distribution
  - Histograms for DTI, LTV, and credit score
  - Stacked bar chart for previous defaults by risk category
- Added interactive slicers for risk category and previous defaults.
- Applied conditional formatting to highlight high-risk applicants.

## Key Insights

- Applicants are segmented into Low, Medium, and High risk based on credit score, DTI, LTV, and default history.
- The dashboard provides a clear visual summary of risk distribution and key applicant metrics.
- Filtering out zeros in ratio columns is essential for meaningful visualizations.

## How to Use

1. **SQL:** Use the provided SQL scripts to create tables, import data, and run risk analysis queries.
2. **Excel:** Import the exported CSVs, build the dashboard using PivotTables, charts, and slicers as described above.
3. **Interpret:** Use the dashboard to identify high-risk applicants and support data-driven lending decisions.

## File Structure

credit-risk-segmentation/
│
├── data/
│ └── credit_risk_segmentation.xlsx
│
├── sql/
│ ├── create_table.sql
│ ├── risk_analysis.sql
│
├── excel/
│ └── credit_risk_dashboard.xlsx
│
├── README.md

## Requirements

- MySQL or compatible SQL database
- Microsoft Excel (2016 or later recommended)

