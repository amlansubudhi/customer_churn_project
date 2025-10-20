{{config(materialized='view')}}
with base as 
    ( select * 
        from  {{ref('stg_customers')}}
    )

select 
    customer_id,
    contract,
    tenure as tenure_months,
    monthly_charges,
    total_charges,
    case when internet_service != 'no' then 1 else 0 end as has_internet,
    case when churn = 'yes' then 1 else 0 end as churn_flag
from base
    