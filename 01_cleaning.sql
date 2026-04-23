create view vw_clean as
select
*
from Fraudulent
where transaction_amount > 0 
and transaction_id is not null