SELECT 
    FORMAT(po.OrderDate, 'yyyy-MM') AS PurchaseMonth,
    SUM(poi.QuantityOrdered * poi.UnitCost) AS MonthlySpend
FROM PurchaseOrders po
JOIN PurchaseOrderItems poi 
    ON po.PurchaseOrderID = poi.PurchaseOrderID
GROUP BY FORMAT(po.OrderDate, 'yyyy-MM')
ORDER BY PurchaseMonth;