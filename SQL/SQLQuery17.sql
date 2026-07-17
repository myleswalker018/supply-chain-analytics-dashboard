USE SupplyChainAnalytics;
GO

CREATE VIEW vw_TotalInventoryValue AS
SELECT 
    SUM(i.QuantityOnHand * p.UnitCost) AS TotalInventoryValue
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID;
GO

CREATE VIEW vw_InventoryValueByCategory AS
SELECT 
    p.Category,
    SUM(i.QuantityOnHand * p.UnitCost) AS InventoryValue
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID
GROUP BY p.Category;
GO

CREATE VIEW vw_ProductsBelowReorderPoint AS
SELECT 
    p.ProductName,
    p.Category,
    i.QuantityOnHand,
    p.ReorderPoint,
    (p.ReorderPoint - i.QuantityOnHand) AS UnitsNeeded
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID
WHERE i.QuantityOnHand < p.ReorderPoint;
GO

CREATE VIEW vw_PurchaseSpendBySupplier AS
SELECT 
    s.SupplierName,
    SUM(poi.QuantityOrdered * poi.UnitCost) AS TotalPurchaseSpend
FROM PurchaseOrderItems poi
JOIN PurchaseOrders po ON poi.PurchaseOrderID = po.PurchaseOrderID
JOIN Suppliers s ON po.SupplierID = s.SupplierID
GROUP BY s.SupplierName;
GO

CREATE VIEW vw_OnTimeDeliveryRate AS
SELECT 
    CAST(
        100.0 * SUM(CASE 
            WHEN ActualDeliveryDate <= ExpectedDeliveryDate THEN 1 
            ELSE 0 
        END) / COUNT(*) 
    AS DECIMAL(5,2)) AS OnTimeDeliveryRate
FROM PurchaseOrders
WHERE ActualDeliveryDate IS NOT NULL;
GO

CREATE VIEW vw_AvgSupplierLeadTime AS
SELECT 
    s.SupplierName,
    AVG(DATEDIFF(DAY, po.OrderDate, po.ActualDeliveryDate)) AS AvgLeadTimeDays
FROM PurchaseOrders po
JOIN Suppliers s ON po.SupplierID = s.SupplierID
WHERE po.ActualDeliveryDate IS NOT NULL
GROUP BY s.SupplierName;
GO

CREATE VIEW vw_LatePurchaseOrders AS
SELECT 
    po.PurchaseOrderID,
    s.SupplierName,
    po.OrderDate,
    po.ExpectedDeliveryDate,
    po.ActualDeliveryDate,
    DATEDIFF(DAY, po.ExpectedDeliveryDate, po.ActualDeliveryDate) AS DaysLate
FROM PurchaseOrders po
JOIN Suppliers s ON po.SupplierID = s.SupplierID
WHERE po.ActualDeliveryDate > po.ExpectedDeliveryDate;
GO

CREATE VIEW vw_ReturnCostBySupplier AS
SELECT 
    s.SupplierName,
    SUM(r.ReturnCost) AS TotalReturnCost,
    SUM(r.QuantityReturned) AS TotalUnitsReturned
FROM Returns r
JOIN Suppliers s ON r.SupplierID = s.SupplierID
GROUP BY s.SupplierName;
GO

CREATE VIEW vw_WarehouseInventoryValue AS
SELECT 
    w.WarehouseName,
    w.Region,
    SUM(i.QuantityOnHand * p.UnitCost) AS InventoryValue
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID
JOIN Warehouses w ON i.WarehouseID = w.WarehouseID
GROUP BY w.WarehouseName, w.Region;
GO

CREATE VIEW vw_MonthlyPurchaseSpend AS
SELECT 
    FORMAT(po.OrderDate, 'yyyy-MM') AS PurchaseMonth,
    SUM(poi.QuantityOrdered * poi.UnitCost) AS MonthlySpend
FROM PurchaseOrders po
JOIN PurchaseOrderItems poi ON po.PurchaseOrderID = poi.PurchaseOrderID
GROUP BY FORMAT(po.OrderDate, 'yyyy-MM');
GO


SELECT * FROM vw_TotalInventoryValue;
SELECT * FROM vw_ProductsBelowReorderPoint;
SELECT * FROM vw_PurchaseSpendBySupplier;
SELECT * FROM vw_OnTimeDeliveryRate;
SELECT * FROM vw_WarehouseInventoryValue;

DROP VIEW vw_OnTimeDeliveryRate;
GO

CREATE VIEW vw_OnTimeDeliveryRate AS
SELECT
    CAST(
        1.0 * SUM(
            CASE
                WHEN ActualDeliveryDate <= ExpectedDeliveryDate THEN 1
                ELSE 0
            END
        ) / COUNT(*)
    AS DECIMAL(5,4)) AS OnTimeDeliveryRate
FROM PurchaseOrders
WHERE ActualDeliveryDate IS NOT NULL;
GO