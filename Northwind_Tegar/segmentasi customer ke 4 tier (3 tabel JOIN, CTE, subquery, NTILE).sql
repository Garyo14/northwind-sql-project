WITH customer_sales AS (
    SELECT c.CustomerID,
           c.CompanyName,
           c.Country,
           COUNT(DISTINCT o.OrderID) AS total_orders,
           ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS total_revenue
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN "Order Details" od ON o.OrderID = od.OrderID
    GROUP BY c.CustomerID, c.CompanyName, c.Country
),
customer_tiers AS (
    SELECT *,
           NTILE(4) OVER (ORDER BY total_revenue DESC) AS tier
    FROM customer_sales
)
SELECT tier,
       COUNT(*) AS customers,
       ROUND(SUM(total_revenue), 2) AS tier_revenue,
       ROUND(100.0 * SUM(total_revenue) /
             (SELECT SUM(total_revenue) FROM customer_sales), 1) AS pct_of_revenue
FROM customer_tiers
GROUP BY tier
ORDER BY tier;
