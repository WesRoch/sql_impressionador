-- GROUP BY + JOIN
-- 01
-- a) Crie um agrupamento mostrando o total de vendas (SalesQuantity) por ano (CalendarYear)
SELECT dimD.CalendarYear AS 'Year',
    SUM(fs.SalesQuantity) AS 'TotalSales'
FROM FactSales fs
INNER JOIN DimDate dimD
    ON fs.Datekey = dimD.Datekey
GROUP BY CalendarYear
ORDER BY CalendarYear DESC;

--b) Considere apenas o mês de janeiro (CalendarMonthLabel)
SELECT dimD.CalendarYear AS 'Year',
    SUM(fs.SalesQuantity) AS 'TotalSales'
FROM FactSales fs
INNER JOIN DimDate dimD
    ON fs.Datekey = dimD.Datekey
WHERE dimD.CalendarMonthLabel = 'January'
GROUP BY CalendarYear
ORDER BY TotalSales DESC;

--c) Considere apenas totalSales >= 1.000.000
SELECT dimD.CalendarYear AS 'Year',
    SUM(fs.SalesQuantity) AS 'TotalSales'
FROM FactSales fs
INNER JOIN DimDate dimD
    ON fs.Datekey = dimD.Datekey
WHERE dimD.CalendarMonthLabel = 'January'
GROUP BY CalendarYear
HAVING SUM(fs.SalesQuantity) >= 1200000
ORDER BY TotalSales DESC;

-- Modulo 08 - Exercícios
--01
SELECT TOP (10) *
FROM FactSales;

SELECT *
FROM DimChannel;

SELECT *
FROM DimStore;

-- a)
SELECT dimC.ChannelName AS 'ChannelName',
    SUM(fs.SalesQuantity) AS 'TotalSales'
FROM FactSales fs
INNER JOIN DimChannel dimC
    ON fs.channelKey = dimC.ChannelKey
GROUP BY dimC.ChannelName
ORDER BY TotalSales DESC;

-- b)
SELECT dimS.StoreName,
    SUM(fs.SalesQuantity) AS 'TotalSales',
    SUM(fs.ReturnQuantity) AS 'ReturnQtd'
FROM FactSales fs
INNER JOIN DimStore dimS
    ON fs.StoreKey = dimS.StoreKey
GROUP BY dimS.StoreName;

--c)
SELECT dimDt.CalendarYear AS 'YearDate',
    dimDt.CalendarMonthLabel AS 'MonthName',
    SUM(fs.SalesAmount) AS 'SalesAmount'
FROM FactSales fs
INNER JOIN DimDate dimDt
    ON fs.DateKey = dimDt.Datekey
GROUP BY dimDt.CalendarYear,
    dimDt.CalendarMonthLabel
ORDER BY YearDate DESC;

-- 02
SELECT dimP.ProductName,
    SUM(fs.SalesAmount) AS 'SalesAmount'
FROM FactSales fs
INNER JOIN DimProduct dimP
    ON fs.ProductKey = dimP.ProductKey
GROUP BY dimP.ProductName;

-- a)
SELECT dimP.ColorName AS 'Color',
    SUM(fs.SalesQuantity) AS 'SalesQtd'
FROM FactSales fs
INNER JOIN DimProduct dimP
    ON fs.ProductKey = dimP.ProductKey
GROUP BY dimP.ColorName
ORDER BY SalesQtd DESC;

-- b)
SELECT dimP.ColorName AS 'Color',
    SUM(fs.SalesQuantity) AS 'SalesQtd'
FROM FactSales fs
INNER JOIN DimProduct dimP
    ON fs.ProductKey = dimP.ProductKey
GROUP BY dimP.ColorName
HAVING SUM(fs.SalesQuantity) >= 3000000
ORDER BY SalesQtd DESC;

-- 3
SELECT dimPC.ProductCategoryName AS 'CategoryName',
    SUM(fs.SalesQuantity) AS 'SalesQtd'
FROM FactSales fs
INNER JOIN DimProduct dimP
    ON fs.ProductKey = dimP.ProductKey
INNER JOIN DimProductSubcategory dimPs
    ON dimP.ProductSubcategoryKey = dimPs.ProductSubcategoryKey
INNER JOIN DimProductCategory dimPC
    ON dimPs.ProductCategoryKey = dimPC.ProductCategoryKey
GROUP BY dimPC.ProductCategoryName
ORDER BY SalesQtd DESC;

