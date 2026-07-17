SELECT 
    SUM(i.QuantityOnHand * p.UnitCost) AS TotalInventoryValue
FROM Inventory i
JOIN Products p 
    ON i.ProductID = p.ProductID;