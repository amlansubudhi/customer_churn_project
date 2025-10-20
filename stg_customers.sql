{{ config(materialized='view') }}

select
    customerid as customer_id,
    initcap(gender) as gender,
    case when seniorcitizen = 1 then 'Yes' else 'No' end as senior_citizen,
    lower(partner) as partner,
    lower(dependents) as dependents,
    tenure,
    lower(phoneservice) as phone_service,
    lower(multiplelines) as multiple_lines,
    lower(internetservice) as internet_service,
    lower(onlinesecurity) as online_security,
    lower(onlinebackup) as online_backup,
    lower(deviceprotection) as device_protection,
    lower(techsupport) as tech_support,
    lower(streamingtv) as streaming_tv,
    lower(streamingmovies) as streaming_movies,
    lower(contract) as contract,
    lower(paperlessbilling) as paperless_billing,
    lower(paymentmethod) as payment_method,
    monthlycharges as monthly_charges,
    totalcharges as total_charges,
    lower(churn) as churn,
    case when internetservice != 'no' then 1 else 0 end as has_internet
from {{ ref('customers') }}



