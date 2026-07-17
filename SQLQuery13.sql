SELECT 
    po.PurchaseOrderID,
    s.SupplierName,
    po.OrderDate,
    po.ExpectedDeliveryDate,
    po.ActualDeliveryDate,
    DATEDIFF(DAY, po.ExpectedDeliveryDate, po.ActualDeliveryDate) AS DaysLate
FROM PurchaseOrders po
JOIN Suppliers s 
    ON po.SupplierID = s.SupplierID
WHERE po.ActualDeliveryDate > po.ExpectedDeliveryDate
ORDER BY DaysLate DESC;