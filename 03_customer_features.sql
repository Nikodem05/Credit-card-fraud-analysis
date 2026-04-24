create view vw_customer as
select
customer_id,
count(*) as total_transactions,
sum(transaction_amount) as total_spent,
avg(transaction_amount) as avg_transacton,
max(transaction_amount) as max_transaction,
min(transaction_date) as first_transaction,
max(transaction_date) as last_transaction,
count(case
when is_fraudulent = 1 then 1
else 0
end) as fraud_count
from vw_clean
group by customer_id
