INSERT INTO Inventory
(ProductID, WarehouseID, QuantityOnHand, LastStockUpdate)
VALUES
(1,1,280,'2026-02-10'),
(2,1,95,'2026-02-10'),
(3,2,55,'2026-02-10'),
(4,2,40,'2026-02-10'),
(5,3,28,'2026-02-10'),
(6,3,18,'2026-02-10'),
(7,4,92,'2026-02-10'),
(8,4,33,'2026-02-10'),
(9,5,26,'2026-02-10'),
(10,5,145,'2026-02-10'),
(11,1,420,'2026-02-10'),
(12,2,510,'2026-02-10'),
(13,3,72,'2026-02-10'),
(14,4,19,'2026-02-10'),
(15,5,17,'2026-02-10');


INSERT INTO Shipments
(PurchaseOrderID, WarehouseID, ShipmentDate, DeliveryStatus, Carrier, FreightCost)
VALUES
(1,1,'2026-01-11','Delivered','FedEx Freight',780.50),
(2,2,'2026-01-20','Delayed','UPS Freight',920.25),
(3,1,'2026-01-25','Delivered','XPO Logistics',640.80),
(4,3,'2026-01-21','Delivered','Old Dominion',455.60),
(5,2,NULL,'In Transit','FedEx Freight',615.40),
(6,4,'2026-02-01','Delivered','Saia',730.15),
(7,5,NULL,'Pending','UPS Freight',810.20),
(8,5,'2026-02-04','Delivered','Estes Express',580.75);


INSERT INTO Returns
(ProductID, SupplierID, ReturnDate, QuantityReturned, ReturnReason, ReturnCost)
VALUES
(2,1,'2026-02-02',12,'Damaged Packaging',150.00),
(5,4,'2026-02-05',3,'Defective Drill',210.00),
(11,3,'2026-02-08',25,'Moisture Damage',70.00),
(15,8,'2026-02-10',2,'Customer Return',230.00),
(9,7,'2026-02-12',4,'Manufacturer Defect',180.00);

SELECT * FROM Returns;