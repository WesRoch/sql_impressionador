USE ContosoRetailDW

-- como podemos melhorarar a seguinte query?

SELECT ChannelKey,
    SUM(SalesQuantity) AS 'QtdVendida'
FROM FactSales
GROUP BY channelKey
ORDER BY QtdVendida DESC;

-- utilizando o INNER JOIN

SELECT DCh.ChannelName,
    SUM(FS.SalesQuantity) AS 'QtdVendida'
FROM DimChannel DCh
INNER JOIN FactSales FS
    ON DCh.ChannelKey = FS.channelKey
GROUP BY DCh.ChannelName
ORDER BY QtdVendida DESC;

-- Exemplo de INNER JOIN, LEFT JOIN e RIGHT JOIN

SELECT DP.ProductKey,
    DP.ProductName,
    DP.ProductSubcategoryKey,
    DPS.ProductSubcategoryName
FROM DimProduct DP
INNER JOIN DimProductSubcategory DPS
    ON DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey;

SELECT DP.ProductKey,
    DP.ProductName,
    DP.ProductSubcategoryKey,
    DPS.ProductSubcategoryName
FROM DimProduct DP
LEFT JOIN DimProductSubcategory DPS
    ON DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey;

-- Quando o inner join e o left join dao o mesmo resultado, no caso acima
-- todos os produtos estao associados a uma subcategoria de produto

SELECT DP.ProductKey,
    DP.ProductName,
    DP.ProductSubcategoryKey,
    DPS.ProductSubcategoryName
FROM DimProduct DP
RIGHT JOIN DimProductSubcategory DPS
    ON DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey;

-- Multiplos JOINS
SELECT DimP.ProductKey,
    DimP.ProductName,
    DimP.ProductSubcategoryKey,
    DimPC.ProductCategoryName
FROM DimProduct DimP
INNER JOIN DimProductSubcategory DimPSC
    ON DimP.ProductSubcategoryKey = DimPSC.ProductSubcategoryKey
INNER JOIN DimProductCategory DimPC
    ON DimPSC.ProductCategoryKey = DimPC.ProductCategoryKey;

-- UNION 
-- Supondo que as queries sejam 2 tabelas separadas
SELECT *
FROM DimCustomer
WHERE Gender = 'F'

UNION

SELECT *
FROM DimCustomer
WHERE Gender = 'M';

-- UNION 
-- Supondo que as queries sejam 2 tabelas separadas
-- Excluiu linhas duplicadas
SELECT FirstName,
    BirthDate
FROM DimCustomer
WHERE Gender = 'F'

UNION ALL

SELECT FirstName,
    BirthDate
FROM DimCustomer
WHERE Gender = 'M';


-- Módulo 07. Exercicios
--01
SELECT DimP.*,
    DimPSC.ProductSubcategoryName
FROM DimProduct DimP
INNER JOIN DimProductSubcategory DimPSC
    ON DimP.ProductSubcategoryKey = DimPSC.ProductSubcategoryKey;

--02
SELECT *
FROM DimProductSubcategory DimPSC
LEFT JOIN DimProductCategory DimPC
    ON DimPSC.ProductCategoryKey = DimPC.ProductCategoryKey;

--03
SELECT DimS.StoreKey,
    DimS.StoreName,
    DimS.EmployeeCount,
    DimG.ContinentName,
    DimG.RegionCountryName
FROM DimStore DimS
LEFT JOIN DimGeography DimG
    ON DimS.GeographyKey = DimG.GeographyKey
ORDER BY DimS.EmployeeCount DESC;

--04
SELECT DimP.ProductName,
    DimP.ColorName,
    DimP.Weight,
    DimPC.ProductCategoryName,
    DimP.BrandName,
    DimP.UnitCost
FROM DimProduct DimP
LEFT JOIN DimProductSubcategory DimPSC
    ON DimP.ProductSubcategoryKey = DimPSC.ProductSubcategoryKey
LEFT JOIN DimProductCategory DimPC
    ON DimPSC.ProductCategoryKey = DimPC.ProductCategoryKey;

--05
--a)
SELECT TOP (100) *
FROM FactStrategyPlan;

--b
SELECT TOP (100) FtSP.StrategyPlanKey,
    FtSP.Datekey,
    DimAcc.AccountName,
    FtSP.Amount
FROM FactStrategyPlan FtSP
INNER JOIN DimAccount DimAcc
    ON FtSP.AccountKey = DimAcc.AccountKey
ORDER BY FtSP.Amount DESC;

--06
SELECT TOP (100) FtSP.StrategyPlanKey,
    FtSP.Datekey,
    DimSce.ScenarioName,
    FtSP.Amount
FROM FactStrategyPlan FtSP
INNER JOIN DimScenario DimSce
    ON FtSP.ScenarioKey = DimSce.ScenarioKey
ORDER BY FtSP.Amount DESC;

--07
SELECT DimPS.ProductSubcategoryKey,
    DimPS.ProductSubcategoryName,
    DimP.ProductName
FROM DimProductSubcategory DimPS
LEFT JOIN DimProduct DimP
    ON DimPS.ProductSubcategoryKey = DimP.ProductSubcategoryKey
WHERE DimP.ProductName IS NULL;

--08
SELECT DISTINCT DimP.BrandName,
    DimCh.ChannelName
FROM DimProduct DimP
INNER JOIN FactSales FtS
    ON DimP.ProductKey = FtS.ProductKey
INNER JOIN DimChannel DimCh
    ON FtS.channelKey = DimCh.ChannelKey
WHERE BrandName IN ('Contoso', 'Fabrikam', 'Litware');

--09
SELECT FtOs.OnlineSalesKey,
    FtOs.DateKey,
    DimPro.PromotionName,
    FtOs.SalesAmount
FROM FactOnlineSales FtOs
INNER JOIN DimPromotion DimPro
    ON FtOs.PromotionKey = DimPro.PromotionKey
WHERE DimPro.PromotionName <> 'No Discount'
ORDER BY FtOs.DateKey ASC;

--10
SELECT FactSales.SalesKey,
    DimCh.ChannelName,
    DimSt.StoreName,
    DimP.ProductName,
    FactSales.SalesAmount
FROM FactSales
INNER JOIN DimProduct DimP
    ON FactSales.ProductKey = DimP.ProductKey
INNER JOIN DimStore DimSt
    ON FactSales.StoreKey = DimSt.StoreKey
INNER JOIN DimChannel DimCh
    ON FactSales.channelKey = DimCh.ChannelKey
ORDER BY FactSales.SalesAmount DESC;
