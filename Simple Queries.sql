-- show all customers in Australia

use classicmodels;
select * from classicmodels.customers
where country = 'Australia'

-- show First and Last name of customers in Melbourne

use classicmodels;
select contactFirstName, contactLastName from classicmodels.customers
where city = 'Melbourne'

-- show all customers with Credit Limit over $200,000

use classicmodels;
select * from classicmodels.customers
where creditLimit > 200000

-- who is the president of the company?

select * from classicmodels.employees
where jobTitle = 'President'

-- how many Sales Reps are in the company?

select count(*) as `num` from classicmodels.employees
where jobTitle = 'Sales Rep'

-- show payments in descending order

select * from classicmodels.payments
order by amount desc

-- what was the check# for the payment done on December 17th 2004

select * from classicmodels.payments
where paymentDate = '2004-12-17'

-- show product line with the word 'realistic' in the description

select * from classicmodels.productlines
where textDescription like '% realistic %'

-- show product name for vendor 'Unimax Art Galleries'

select productName from classicmodels.products
where productVendor = 'Unimax Art Galleries'

-- what is the customer number for the highest amount of payment

select customerNumber, amount from classicmodels.payments
order by amount desc
limit 1;