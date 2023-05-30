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