USE ContosoRetailDW

-- Total de qtd vendida e total devolvido

SELECT
    SUM(SalesQuantity) AS 'TotalVendido',
    SUM(ReturnQuantity) AS 'TotalDevolvido'
FROM
    FactSales

-- Usando o COUNT

SELECT
    COUNT(*) AS 'TotalProdutos'
FROM
    DimProduct

SELECT
    COUNT(ProductName) AS 'QtdProdutos'
FROM
    DimProduct

-- Como o size tem null, retornou menos 
SELECT
    COUNT(Size) AS 'QtdSize'
FROM
    DimProduct

-- qtd distinta de cores dos produtos

SELECT COUNT(DISTINCT ColorName)
FROM DimProduct

