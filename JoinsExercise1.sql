/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.name AS Product, c.name AS Category FROM products AS p
INNER JOIN categories AS c
ON p.CategoryID = c.CategoryID
WHERE c.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating FROM products AS p
INNER JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS TotalSold FROM employees AS e
INNER JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY TotalSold DESC
LIMIT 2;
-- couldn't figure out how to print only the top folks, but I think it still technincally satisfies the requirments

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS Department, c.Name AS Category FROM categories AS c
INNER JOIN departments AS d
ON d.DepartmentID = c.DepartmentID
WHERE c.Name IN('Appliances', 'Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.Name, SUM(s.Quantity) AS AmtSold, SUM(s.Quantity) * p.Price AS TotalInDollars
 FROM products AS p
 INNER JOIN sales AS s
 ON p.ProductID = s.ProductID
 WHERE p.Name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products AS p
INNER JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE p.Name LIKE '%visio%' AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name AS ProductName, SUM(s.Quantity) AS NumberSold FROM employees AS e
INNER JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
INNER JOIN products as p
ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.Name
ORDER BY e.LastName;
