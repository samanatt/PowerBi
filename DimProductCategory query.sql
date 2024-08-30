SELECT 
    ProductCategoryID,
    Name AS ProductCategoryName
INTO AdventureWorksDW2019_SamanSample.dbo.DimProductCategory
FROM AdventureWorks2019.Production.ProductCategory;
