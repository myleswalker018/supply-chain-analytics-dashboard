SELECT 
    w.WarehouseName,
    w.Region,
    SUM(i.QuantityOnHand * p.UnitCost) AS InventoryValue
FROM Inventory i
JOIN Products p 
    ON i.ProductID = p.ProductID
JOIN Warehouses w 
    ON i.WarehouseID = w.WarehouseID
GROUP BY w.WarehouseName, w.Region
ORDER BY InventoryValue DESC;