SELECT 
    ProductSubcategoryID,
    Name AS ProductSubcategoryName,
    ProductCategoryID
INTO AdventureWorksDW2019_SamanSample.dbo.DimProductSubcategory  
FROM AdventureWorks2019.Production.ProductSubcategory;
