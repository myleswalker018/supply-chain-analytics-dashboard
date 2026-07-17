SELECT 
    p.ProductName,
    p.Category,
    i.QuantityOnHand,
    p.ReorderPoint
FROM Inventory i
JOIN Products p 
    ON i.ProductID = p.ProductID
WHERE i.QuantityOnHand < p.ReorderPoint
ORDER BY i.QuantityOnHand ASC;