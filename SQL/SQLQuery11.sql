SELECT 
    CAST(
        100.0 * SUM(CASE 
            WHEN ActualDeliveryDate <= ExpectedDeliveryDate THEN 1 
            ELSE 0 
        END) / COUNT(*) 
    AS DECIMAL(5,2)) AS OnTimeDeliveryRate
FROM PurchaseOrders
WHERE ActualDeliveryDate IS NOT NULL;