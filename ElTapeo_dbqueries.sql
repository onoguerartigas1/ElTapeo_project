/*JOSE SERRANO, CLAUDIA RIERA, ORIOL NOGUER*/

/*Queries that show all the table information*/
SELECT *
FROM dbo.Customer;

SELECT *
FROM dbo.Employees;

SELECT *
FROM dbo.Orders;

SELECT *
FROM dbo.MenuItem;

SELECT *
FROM dbo.Location_Table;

SELECT *
FROM dbo.OrderMenuDetails;


/*Number of employees of the company*/
SELECT Count(EmployeeID) AS Number_of_employees
FROM dbo.Employees;
 

/*Show the employees who work in each restaurant location*/
SELECT StoreName, EmployeeID, FirstName, LastName
FROM dbo.Employees
	INNER JOIN dbo.Location_Table ON dbo.Employees.LocationID = dbo.Location_Table.LocationID
GROUP BY EmployeeID, FirstName, LastName, StoreName
ORDER BY StoreName;


/*We want to know the payment method that every costumer used for their purchase. 
If they used a credit it will show their cartype (AMEX, visa, etc) and if they used cash it will show as NULL.*/
SELECT dbo.Customer.CustomerID, FirstName, LastName, CardType
FROM dbo.Customer
	LEFT OUTER JOIN dbo.Orders ON dbo.Customer.CustomerID = dbo.Orders.CustomerID
GROUP BY dbo.Customer.CustomerID, FirstName, LastName, CardType;


/*Show the top customers that outperformed the average consumption of all the customers in the restaurant*/
/*We are doing this so we can filter our best customers in order to award them for being the best customers
that we have so we can further improve our relationship with them. (We could do that monthly but we will have
to add another column to the Orders dimension table*/
SELECT dbo.Customer.CustomerID, FirstName, LastName, Email, Phone
FROM dbo.Customer
	INNER JOIN dbo.Orders ON dbo.Customer.CustomerID = dbo.Orders.CustomerID
WHERE AmountDue > 
			(SELECT AVG(AmountDue) AS Order_Average
			FROM Orders)
ORDER BY AmountDue DESC;