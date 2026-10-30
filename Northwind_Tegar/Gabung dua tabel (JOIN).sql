SELECT p.ProductName, c.CategoryName, p.UnitPrice
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID;