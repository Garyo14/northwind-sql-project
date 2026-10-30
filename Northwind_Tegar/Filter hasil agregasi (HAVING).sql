SELECT CategoryID, COUNT(*) AS jumlah_produk
FROM Products
GROUP BY CategoryID
HAVING COUNT(*) > 10;