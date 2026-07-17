USE SupplyChainAnalytics;
GO

INSERT INTO Suppliers (SupplierName, ContactName, Country, LeadTimeDays, Rating)
VALUES
('ProBuild Materials', 'James Carter', 'USA', 7, 4.60),
('Metro Industrial Supply', 'Angela Brooks', 'USA', 10, 4.20),
('Global Hardware Partners', 'Daniel Lee', 'Canada', 14, 3.90),
('Prime Tools Distribution', 'Rachel Smith', 'USA', 6, 4.75),
('EcoHome Products', 'Monica Green', 'USA', 12, 4.10),
('Summit Electrical Supply', 'Kevin Harris', 'USA', 9, 4.30),
('BlueLine Plumbing Supply', 'Carlos Rivera', 'Mexico', 15, 3.80),
('NorthStar Logistics', 'Tanya Wilson', 'USA', 8, 4.50);


SELECT * FROM Suppliers;


INSERT INTO Warehouses (WarehouseName, City, State, Region)
VALUES
('Atlanta Distribution Center', 'Atlanta', 'GA', 'Southeast'),
('Dallas Regional Warehouse', 'Dallas', 'TX', 'Southwest'),
('Chicago Supply Hub', 'Chicago', 'IL', 'Midwest'),
('Phoenix Fulfillment Center', 'Phoenix', 'AZ', 'West'),
('New Jersey Distribution Center', 'Newark', 'NJ', 'Northeast');


SELECT * FROM Warehouses;


INSERT INTO Products (ProductName, Category, UnitCost, UnitPrice, ReorderPoint, SupplierID)
VALUES
('Premium 2x4 Lumber Pack', 'Lumber', 3.50, 5.98, 150, 1),
('Concrete Mix 80 lb Bag', 'Building Materials', 4.25, 6.75, 120, 1),
('Interior Wall Paint Gallon', 'Paint', 18.00, 32.98, 80, 5),
('Exterior Deck Stain', 'Paint', 21.50, 39.98, 60, 5),
('Cordless Drill Kit', 'Tools', 72.00, 129.00, 40, 4),
('Circular Saw', 'Tools', 65.00, 119.00, 35, 4),
('LED Ceiling Light Fixture', 'Electrical', 24.00, 49.98, 75, 6),
('Electrical Wire Roll', 'Electrical', 38.00, 69.98, 50, 6),
('Kitchen Faucet', 'Plumbing', 58.00, 109.00, 45, 7),
('Toilet Fill Valve Kit', 'Plumbing', 7.50, 15.98, 100, 7),
('Garden Soil Bag', 'Garden', 2.85, 5.48, 200, 3),
('Mulch Bag', 'Garden', 2.25, 4.28, 250, 3),
('Storage Tote 27 Gallon', 'Storage', 8.75, 16.98, 90, 2),
('Heavy Duty Shelving Unit', 'Storage', 55.00, 99.00, 30, 2),
('Smart Thermostat', 'Smart Home', 115.00, 199.00, 25, 8);

SELECT * FROM Products;