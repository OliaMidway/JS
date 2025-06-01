1.how many vendors, product lines, and products exist in the database?

select count(distinct a.productVendor) as total_vendors
from classicmodels.products a
join classicmodels.productlines b
on a.productLine = b.productLine
order by a.productVendor;

select count(distinct a.productName) as total_products
from classicmodels.products a
join classicmodels.productlines b
on a.productLine = b.productLine
order by a.productName;

select count(distinct a.productLine) as total_productlines
from classicmodels.productlines b
left join classicmodels.products a
on a.productLine = b.productLine
order by a.productLine;

2.what is the average price (buy price, MSRP) per vendor?

select productVendor, avg(buyPrice) as average_price, avg(MSRP) as average_MSRP
from classicmodels.products
group by productVendor;

3.what is the average price (buy price, MSRP) per customer?

SELECT 
    c.customerNumber,
    c.customerName,
    AVG(p.buyPrice) AS avg_buy_price,
    AVG(p.MSRP) AS avg_MSRP
FROM 
    classicmodels.customers c
JOIN 
    classicmodels.orders o ON c.customerNumber = o.customerNumber
JOIN 
    classicmodels.orderdetails od ON o.orderNumber = od.orderNumber
JOIN 
    classicmodels.products p ON od.productCode = p.productCode
GROUP BY 
    c.customerNumber, c.customerName;

4.what product was sold the most?

select
p.productName,
sum(od.quantityOrdered) as total_quantity_sold
from classicmodels.orderdetails od
join classicmodels.products p on od.productCode = p.productCode
group by
p.productName
order by total_quantity_sold desc
limit 1;

5.how much money was made between buyPrice and MSRP?

SELECT 
    SUM(p.MSRP-p.buyPrice)
FROM 
    classicmodels.customers c
JOIN 
    classicmodels.orders o ON c.customerNumber = o.customerNumber
JOIN 
    classicmodels.orderdetails od ON o.orderNumber = od.orderNumber
JOIN 
    classicmodels.products p ON od.productCode = p.productCode;

6.which vendor sells more products?

select
p.productVendor,
sum(od.quantityOrdered) as total_quantity_sold
from classicmodels.orderdetails od
join classicmodels.products p on od.productCode = p.productCode
group by
p.productVendor
order by total_quantity_sold desc
limit 1;

7.rank customers by credit limit

SELECT 
    customerNumber,
    customerName,
    creditLimit,
    RANK() OVER (ORDER BY creditLimit DESC) AS credit_rank
FROM 
    classicmodels.customers;

8.list the most sold product by city

SELECT city, productName, total_quantity
FROM (
    SELECT 
        c.city,
        p.productName,
        SUM(od.quantityOrdered) AS total_quantity,
        RANK() OVER (PARTITION BY c.city ORDER BY SUM(od.quantityOrdered) DESC) AS rnk
    FROM classicmodels.customers c
    JOIN classicmodels.orders o ON c.customerNumber = o.customerNumber
    JOIN classicmodels.orderdetails od ON o.orderNumber = od.orderNumber
    JOIN classicmodels.products p ON od.productCode = p.productCode
    GROUP BY c.city, p.productName
) AS ranked
WHERE rnk = 1
ORDER BY city;

9.what is the average number of orders per customer?

SELECT 
    COUNT(DISTINCT o.orderNumber) / COUNT(DISTINCT c.customerNumber) AS avg_orders_per_customer
FROM classicmodels.customers c
JOIN classicmodels.orders o ON c.customerNumber = o.customerNumber;

10.what is the average number of days between the order date and ship date?

SELECT 
    AVG(DATEDIFF(shippedDate, orderDate)) AS avg_days_to_ship
FROM classicmodels.orders
WHERE shippedDate IS NOT NULL AND orderDate IS NOT NULL;

11.sales by year

SELECT 
    YEAR(paymentDate) AS year,
    ROUND(SUM(amount), 2) AS total_sales
FROM classicmodels.payments
GROUP BY YEAR(paymentDate)
ORDER BY year;

12.how many orders are not shipped?

SELECT COUNT(*) AS not_shipped_orders
FROM classicmodels.orders
WHERE status != 'Shipped';

13.list of employees  by how much they sold in 2003?

SELECT 
    e.employeeNumber,
    e.lastName,
    e.firstName,
    SUM(od.quantityOrdered * od.priceEach) AS total_sales_2003
FROM classicmodels.employees e
JOIN classicmodels.customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN classicmodels.orders o ON c.customerNumber = o.customerNumber
JOIN classicmodels.orderdetails od ON o.orderNumber = od.orderNumber
WHERE YEAR(o.orderDate) = 2003
GROUP BY e.employeeNumber, e.lastName, e.firstName
ORDER BY total_sales_2003 DESC;

14.which city has the most number of employees?

SELECT 
    o.city, 
    COUNT(*) AS employee_count
FROM classicmodels.employees e
JOIN classicmodels.offices o ON e.officeCode = o.officeCode
GROUP BY o.city
ORDER BY employee_count DESC
LIMIT 1;