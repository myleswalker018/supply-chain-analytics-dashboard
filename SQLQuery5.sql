INSERT INTO PurchaseOrders
(SupplierID, OrderDate, ExpectedDeliveryDate, ActualDeliveryDate, OrderStatus)
VALUES
(1, '2026-01-05', '2026-01-12', '2026-01-11', 'Delivered'),
(2, '2026-01-08', '2026-01-18', '2026-01-20', 'Delivered'),
(3, '2026-01-12', '2026-01-26', '2026-01-25', 'Delivered'),
(4, '2026-01-15', '2026-01-21', '2026-01-21', 'Delivered'),
(5, '2026-01-18', '2026-01-30', NULL, 'In Transit'),
(6, '2026-01-22', '2026-01-31', '2026-02-01', 'Delivered'),
(7, '2026-01-25', '2026-02-09', NULL, 'Pending'),
(8, '2026-01-28', '2026-02-05', '2026-02-04', 'Delivered');

SELECT * FROM PurchaseOrders;


INSERT INTO PurchaseOrderItems
(PurchaseOrderID, ProductID, QuantityOrdered, UnitCost)
VALUES
(1,1,400,3.50),
(1,2,250,4.25),
(2,13,120,8.75),
(2,14,50,55.00),
(3,11,500,2.85),
(3,12,700,2.25),
(4,5,80,72.00),
(4,6,60,65.00),
(5,3,100,18.00),
(5,4,80,21.50),
(6,7,150,24.00),
(6,8,100,38.00),
(7,9,75,58.00),
(7,10,200,7.50),
(8,15,40,115.00);


SELECT * FROM PurchaseOrderItems;