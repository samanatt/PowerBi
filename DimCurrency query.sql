SELECT 
    CurrencyCode AS CurrencyKey,  -- Unique identifier for the currency
    Name AS CurrencyName            -- Name of the currency
INTO AdventureWorksDW2019_SamanSample.dbo.DimCurrency
FROM AdventureWorks2019.Sales.Currency;
