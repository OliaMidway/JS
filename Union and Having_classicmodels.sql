select customerNumber, customerName, city
from classicmodels.customers
where city = 'San Francisco'
UNION
select customerNumber, customerName, city
from classicmodels.customers
where city = 'NYC'
UNION
select customerNumber, customerName, city
from classicmodels.customers
where city = 'Boston';
-- ----------------------------------------
-- SUBQUERY #1
SELECT COUNT(*) FROM
(select customerNumber, customerName, city
from classicmodels.customers
where city = 'San Francisco'
UNION
select customerNumber, customerName, city
from classicmodels.customers
where city = 'NYC'
UNION
select customerNumber, customerName, city
from classicmodels.customers
where city = 'Boston')as a;

-- SUBQUERY #2
-- show all info on customers who spent over 70K
select customerNumber, customerName, city, state, country
from classicmodels.customers
where customerNumber in 
(select customerNumber from classicmodels.payments 
group by customerNumber
having sum(amount) >70000);