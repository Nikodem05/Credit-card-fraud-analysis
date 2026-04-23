-- Total transaction value in dataset
select 
sum(transaction_amount) as total_spending
from vw_clean

-- Average transaction amount
select
avg(transaction_amount) as avg_transaction
from vw_clean

-- Monthly spending trend
Select
month(transaction_date) as month,
sum(transaction_amount) as monthly_spending
from vw_clean
group by month(transaction_date)
order by month(transaction_date)

-- Percentage of fraudulent transactions
select
SUM(CASE WHEN is_fraudulent = 1 THEN 1 ELSE 0 END) * 1.0 / count(*) as fraud_rate
from vw_clean

--Transaction volume by hour of day
select
transaction_hour,
count(*) as transactions
from vw_clean
group by transaction_hour
order by transaction_hour