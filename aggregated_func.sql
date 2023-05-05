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

-- maior e menor preco dos produtos

SELECT MAX(UnitPrice) AS 'Custo Maximo',
    MIN(UnitPrice) AS 'Custo Minimo'
FROM DimProduct

-- media de salario dos clientes

SELECT
    AVG(YearlyIncome) AS 'MediaRendaAnual'
FROM DimCustomer

