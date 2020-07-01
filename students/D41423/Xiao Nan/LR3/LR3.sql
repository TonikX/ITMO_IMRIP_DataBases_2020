--1.--Query, the names and contact information of all brokers, sorted by name
SELECT Brokers_Name, Contact 
FROM Brokers
ORDER BY Brokers_Name;

--2.--Query, All information of all brokers which name start by V, sorted by Brokers_ID
SELECT * FROM Brokers 
WHERE Brokers_Name LIKE 'V%'
ORDER BY Brokers_ID;

--3.--Query, the id, names and officename information of all brokers, sorted by name
SELECT Brokers.Brokers_ID, Brokers.Brokers_Name, Brokers_Office.Office_Name
FROM Brokers, Broker_fee, Brokers_Office
WHERE Brokers.Brokers_ID = Broker_fee.Brokers_ID
AND Broker_fee.Office_ID = Brokers_Office.Office_ID
Order by Brokers_Name;

--4.--Query, all orders information and brokers name completed by brokers after April 1st
SELECT Orders_records.*, Brokers.Brokers_Name
FROM Orders_records, Brokers
WHERE Orders_records.Brokers_ID = Brokers.Brokers_ID
AND Orders_records.Date_contract > '2020-04-01'

--5.--Query, all orders completed by brokers which belong to the ID:14147 office
SELECT *
FROM Orders_records 
Inner Join (
   SELECT Brokers.Brokers_ID as ID
   FROM Brokers, Broker_fee, Brokers_Office
   WHERE Brokers.Brokers_ID = Broker_fee.Brokers_ID
   AND Broker_fee.Office_ID = Brokers_Office.Office_ID
   AND Brokers_Office.Office_ID = 14147) Bk
ON Orders_records.Brokers_ID = Bk.ID

--6.--Query, all orders total price which product belong to the Company PPD Company
SELECT sum(Price.total)
FROM Orders_records, Product, Company
WHERE Orders_records.Product_ID = Product.Product_ID
AND Product.Company_ID = Company.Company_ID
AND Company.Company_Name = 'PPD Company'

--7.--Query,Companies with fewer than 5 products
SELECT Company_ID, Company_Name
FROM Product, Company
WHERE Product.Company_ID = Company.Company_ID
GROUP BY Company_ID
HAVING COUNT(Product_ID) < 5

--8.--Query,Companies that sell at least one kind product after April 1st
SELECT Company_ID, Company_Name
FROM Product, Company
WHERE Product.Company_ID = Company.Company_ID
AND Product.ID = ANY(
                 SELECT DISTINCT Product_ID FROM Orders_records
                 WHERE Orders_records.Date_contract > '2020-04-01')

--9.--Query, the customer information and Broker information for the largest single order.
SELECT Customer.Customer_ID, Customer.Customer_Name, Brokers.Brokers_ID, Brokers.Brokers_Name
FROM Customer, Contract, Orders_records, Brokers
WHERE Customer.Customer_ID = Contract.Customer_ID
AND Contract.Lot_number = Orders_records.Lot_number
AND Orders_records.Brokers_ID = Brokers.Brokers_ID
AND Price_total = (select max(Price_total) from Orders_records)

--10.--Query, the brokers who set the orders including company PPDCompany's product.
SELECT Brokers_ID, Brokers_Name
FROM Brokers, Orders_records
WHERE Brokers.Brokers_ID = Orders_records.Brokers_ID
AND Orders_records.Product_ID = ANY(
                                SELECT Product.Product_ID FROM Product, Company
                                WHERE Product.Company_ID = Company.Company_ID
								AND Company.Company_Name = 'PPD Company')

--11.--Query, Total Fee of various brokers' offices.
SELECT Brokers_Office.Office_Name,sum(Fixed_fee)
FROM Broker_Fee, Brokers_Office
WHERE Broker_Fee.Office_ID = Brokers_Office.Office_ID
GROUP BY Brokers_Office.Office_Name

--12.--Query, all brokers' information and the lot number and total price of orders they set
SELECT Brokers.Brokers_ID, Brokers.Brokers_Name, Brokers.Contact, Orders_records.Lot_number, Orders_records.Price_total
FROM Brokers
LEFT JOIN Orders_records
ON Brokers.Brokers_ID = Orders_records.Brokers_ID

--13.--Query, all orders records and according to the total price, it is divided into small amount, medium amount and large amount
SELECT Orders_Records.Lot_number,  
    case      
    when Orders_Records.Price_total < 1000 then "Small_Amount"  
	when Orders_Records.Price_total > 2000 then "Large_Amount"       
    else "Medium_Amount"      
    end as Amount      
from Orders_Records






















