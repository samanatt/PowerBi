
SELECT 
    soh.SalesOrderID,                           -- Unique identifier for the sales order
    CAST(soh.OrderDate AS DATE) AS OrderDate,  -- Date of the order
    CAST(soh.DueDate AS DATE) AS DueDate,      -- Due date for the order
    CAST(soh.ShipDate AS DATE) AS ShipDate,    -- Shipping date for the order
    C.CustomerID AS CustomerKey,                -- Foreign key to DimCustomer
    P.ProductID AS ProductKey,                  -- Foreign key to DimProduct
    CR.FromCurrencyCode AS CurrencyKey,         -- Foreign key to DimCurrency
    SUM(sod.OrderQty) AS OrderQuantity,         -- Total quantity ordered
    AVG(sod.UnitPrice) AS UnitPrice,            -- Average unit price of the product
    SUM(sod.UnitPriceDiscount) AS UnitPriceDiscount, -- Total discount applied to the unit price
    SUM(sod.LineTotal) AS ExtendedAmount,       -- Total amount for the line item
    SUM(sod.LineTotal) AS SalesAmount,          -- Total sales amount for the order
    soh.TaxAmt                                -- Total tax amount for the order
INTO AdventureWorksDW2019_SamanSample.dbo.FactInternetSales
FROM AdventureWorks2019.Sales.SalesOrderHeader AS soh
LEFT JOIN AdventureWorks2019.Sales.Customer AS C ON soh.CustomerID = C.CustomerID
LEFT JOIN AdventureWorks2019.Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
LEFT JOIN AdventureWorks2019.Production.Product AS P ON sod.ProductID = P.ProductID
LEFT JOIN AdventureWorks2019.Sales.CurrencyRate AS CR ON soh.CurrencyRateID = CR.CurrencyRateID

GROUP BY 
    soh.SalesOrderID,
    CAST(soh.OrderDate AS DATE),
    CAST(soh.DueDate AS DATE),
    CAST(soh.ShipDate AS DATE),
    C.CustomerID,
    P.ProductID,          
    CR.FromCurrencyCode,
    soh.TaxAmt;
