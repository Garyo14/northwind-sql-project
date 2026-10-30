SELECT ProductName, UnitPrice,
       RANK() OVER (ORDER BY UnitPrice DESC) AS peringkat
FROM Products;