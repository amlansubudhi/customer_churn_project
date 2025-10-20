# Customer Churn Prediction | dbt + Snowflake + Python

# Overview
This project predicts telecom customer churn using an end-to-end modern data stack.

# Tech Stack
- **dbt (Core)** – for data transformation and testing  
- **Snowflake** – as the data warehouse  
- **Python (pandas, scikit-learn)** – for model training and evaluation  

# Workflow
1. Loaded raw CSV data into Snowflake using dbt `seeds`.
2. Created `stg_customers` model to clean and standardize data.
3. Exported the processed data and trained a Logistic Regression model in Python.
4. Evaluated model performance (Accuracy: 82%, F1-score: 0.63 for churn class).

# Results
- Identified key churn indicators such as tenure, contract type, and online security.
- Built a reproducible and scalable churn prediction pipeline.


---

# Author: Amlan Subudhi
# Linkedin: https://www.linkedin.com/in/amlansubudhi/
