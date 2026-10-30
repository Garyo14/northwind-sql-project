SELECT Country, COUNT(*) AS jumlah_customer
FROM Customers
GROUP BY Country
ORDER BY jumlah_customer DESC;