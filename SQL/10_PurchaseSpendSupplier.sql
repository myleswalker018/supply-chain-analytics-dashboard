SELECT 
    s.SupplierName,
    SUM(poi.QuantityOrdered * poi.UnitCost) AS TotalPurchaseSpend
FROM PurchaseOrderItems poi
JOIN PurchaseOrders po 
    ON poi.PurchaseOrderID = po.PurchaseOrderID
JOIN Suppliers s 
    ON po.SupplierID = s.SupplierID
GROUP BY s.SupplierName
ORDER BY TotalPurchaseSpend DESC;