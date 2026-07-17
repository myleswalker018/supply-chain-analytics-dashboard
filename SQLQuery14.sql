SELECT 
    s.SupplierName,
    SUM(r.ReturnCost) AS TotalReturnCost,
    SUM(r.QuantityReturned) AS TotalUnitsReturned
FROM Returns r
JOIN Suppliers s 
    ON r.SupplierID = s.SupplierID
GROUP BY s.SupplierName
ORDER BY TotalReturnCost DESC;