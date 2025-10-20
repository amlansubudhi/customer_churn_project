{{ config(materialized='table') }}

with metrics as (

    select
        contract,
        case 
            when tenure_months <= 12 then '0-12'
            when tenure_months <= 24 then '13-24'
            when tenure_months <= 48 then '25-48'
            else '49+' 
        end as tenure_group,
        count(*) as total_customers,
        sum(churn_flag) as churned_customers,
        avg(monthly_charges) as avg_monthly_charges
    from {{ ref('int_customer_metrics') }}
    group by 1,2
)

select
    contract,
    tenure_group,
    total_customers,
    churned_customers,
    round(churned_customers*100.0/total_customers,2) as churn_rate_pct,
    round(avg_monthly_charges,2) as avg_monthly_charges
from metrics
order by contract, tenure_group
