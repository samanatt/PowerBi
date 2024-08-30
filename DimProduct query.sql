SELECT 
    ProductID,
    Name AS ProductName,
    Color,
    Size,
    Weight,
    ProductSubcategoryID
INTO AdventureWorksDW2019_SamanSample.dbo.DimProduct
FROM AdventureWorks2019.Production.Product;
