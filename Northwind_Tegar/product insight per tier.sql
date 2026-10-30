WITH customer_sales AS (
    SELECT o.CustomerID,
           SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_revenue
    FROM Orders o
    JOIN "Order Details" od ON o.OrderID = od.OrderID
    GROUP BY o.CustomerID
),
customer_tiers AS (
    SELECT CustomerID,
           NTILE(4) OVER (ORDER BY total_revenue DESC) AS tier
    FROM customer_sales
)
SELECT ct.tier,
       cat.CategoryName,
       ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 0) AS revenue,
       RANK() OVER (PARTITION BY ct.tier
                    ORDER BY SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) DESC) AS rank_in_tier
FROM customer_tiers ct
JOIN Orders o ON ct.CustomerID = o.CustomerID
JOIN "Order Details" od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories cat ON p.CategoryID = cat.CategoryID
GROUP BY ct.tier, cat.CategoryName
ORDER BY ct.tier, rank_in_tier;