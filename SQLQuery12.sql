SELECT 
    s.SupplierName,
    AVG(DATEDIFF(DAY, po.OrderDate, po.ActualDeliveryDate)) AS AvgLeadTimeDays
FROM PurchaseOrders po
JOIN Suppliers s 
    ON po.SupplierID = s.SupplierID
WHERE po.ActualDeliveryDate IS NOT NULL
GROUP BY s.SupplierName
ORDER BY AvgLeadTimeDays DESC;