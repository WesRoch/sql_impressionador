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
ORDER BY CalendarYear DESC;

