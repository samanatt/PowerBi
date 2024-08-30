WITH Dates AS (
    SELECT DISTINCT OrderDate
    FROM AdventureWorksDW2019_SamanSample.dbo.FactInternetSales
)
SELECT 
    CONVERT(DATE, OrderDate) AS FullDateAlternateKey,
    YEAR(OrderDate) AS FiscalYear,
    MONTH(OrderDate) AS FiscalMonth
INTO AdventureWorksDW2019_SamanSample.dbo.DimDate
FROM Dates;
