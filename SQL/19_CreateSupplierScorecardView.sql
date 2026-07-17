CREATE VIEW vw_SupplierScorecard AS
SELECT
    s.SupplierID,
    s.SupplierName,
    s.Rating,

    ISNULL(ps.TotalPurchaseSpend,0) AS TotalPurchaseSpend,

    ISNULL(lt.AvgLeadTimeDays,0) AS AvgLeadTimeDays,

    ISNULL(rc.TotalReturnCost,0) AS TotalReturnCost,

    ISNULL(rc.TotalUnitsReturned,0) AS TotalUnitsReturned

FROM Suppliers s

LEFT JOIN
(
    SELECT
        po.SupplierID,
        SUM(poi.QuantityOrdered * poi.UnitCost) AS TotalPurchaseSpend
    FROM PurchaseOrders po
    JOIN PurchaseOrderItems poi
        ON po.PurchaseOrderID = poi.PurchaseOrderID
    GROUP BY po.SupplierID
) ps
ON s.SupplierID = ps.SupplierID

LEFT JOIN
(
    SELECT
        SupplierID,
        AVG(DATEDIFF(DAY,OrderDate,ActualDeliveryDate)) AS AvgLeadTimeDays
    FROM PurchaseOrders
    WHERE ActualDeliveryDate IS NOT NULL
    GROUP BY SupplierID
) lt
ON s.SupplierID = lt.SupplierID

LEFT JOIN
(
    SELECT
        SupplierID,
        SUM(ReturnCost) AS TotalReturnCost,
        SUM(QuantityReturned) AS TotalUnitsReturned
    FROM Returns
    GROUP BY SupplierID
) rc
ON s.SupplierID = rc.SupplierID;

SELECT * 
FROM vw_SupplierScorecard;


SELECT *
FROM dbo.vw_SupplierScorecard;