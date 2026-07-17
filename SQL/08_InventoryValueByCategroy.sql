SELECT 
    p.Category,
    SUM(i.QuantityOnHand * p.UnitCost) AS InventoryValue
FROM Inventory i
JOIN Products p 
    ON i.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY InventoryValue DESC;