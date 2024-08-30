SELECT 
    C.CustomerID AS CustomerKey,    -- Unique identifier for the customer
    P.FirstName,                     -- Customer's first name
    P.LastName,                      -- Customer's last name
    E.EmailAddress,                  -- Customer's email address
    PP.PhoneNumber AS PhoneNumber    -- Customer's phone number
INTO AdventureWorksDW2019_SamanSample.dbo.DimCustomer  
FROM AdventureWorks2019.Sales.Customer AS C
LEFT JOIN AdventureWorks2019.Person.Person AS P ON C.PersonID = P.BusinessEntityID
LEFT JOIN AdventureWorks2019.Person.EmailAddress AS E ON P.BusinessEntityID = E.BusinessEntityID
LEFT JOIN AdventureWorks2019.Person.PersonPhone AS PP ON P.BusinessEntityID = PP.BusinessEntityID;
