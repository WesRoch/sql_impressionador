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