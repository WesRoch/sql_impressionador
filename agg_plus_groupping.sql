USE ContosoRetailDW

SELECT *
FROM DimProduct

-- retornando a qtd total de cada marca
SELECT BrandName AS 'Nome Marca',
    COUNT(*) AS 'Qtd Total'
FROM DimProduct
GROUP BY BrandName

-- agrupamento dos funcionarios por tipo
SELECT *
FROM DimStore

SELECT StoreType AS 'Tipo Loja',
    SUM(EmployeeCount) AS 'Qtd Funcionario'
FROM DimStore
GROUP BY StoreType
ORDER BY [Qtd Funcionario] DESC

-- media de custo de acordo com o brand name
SELECT *
FROM DimProduct

SELECT BrandName AS 'Nome Marca',
    AVG(UnitCost) AS 'Media CustoUnitario'
FROM DimProduct
GROUP BY BrandName
ORDER BY [Media CustoUnitario] DESC

-- produto mais caro de acordo com a classe
SELECT ClassName AS 'Classe Produto',
    MAX(UnitPrice) 'Produto Mais Caro'
FROM DimProduct
GROUP BY ClassName
ORDER BY [Produto Mais Caro] DESC

-- agrupamento de store type de acordo com a loja e qtd de func
SELECT *
FROM DimStore

SELECT StoreType AS 'Tipo Loja',
    SUM(EmployeeCount) AS 'Qtd Funcionarios'
FROM DimStore
GROUP BY StoreType
ORDER BY [Qtd Funcionarios] DESC

--  agrupamento de acordo com a qtd total de produtos de acordo com a cor da marca Contoso
SELECT *
FROM DimProduct

SELECT ColorName AS 'Cor Produto',
    COUNT(ProductKey) AS 'Qtd Total Produtos'
FROM DimProduct
WHERE BrandName = 'Contoso'
GROUP BY ColorName
ORDER BY [Qtd Total Produtos] DESC

--  retorne a qtd de produtos das marcas contoso e fabrikam igual ou acima de 200 produtos
SELECT BrandName AS 'NomeMarca',
    COUNT(BrandName) AS 'TotalMarca'
FROM DimProduct
WHERE BrandName = 'Contoso' --filtra a tabela original, antes do agrupamento
    OR BrandName = 'Fabrikam'
GROUP BY BrandName
HAVING COUNT(BrandName) >= 200 -- filtra a tabela depois de agrupada
ORDER BY [TotalMarca] DESC

-- Modulo 06: Exercicios
-- 01.
SELECT *
FROM FactSales

--a)
SELECT channelKey AS 'CanalVendas',
    SUM(SalesQuantity) AS 'Qtd Vendas'
FROM FactSales
GROUP BY channelKey
ORDER BY [Qtd Vendas] DESC

--b)
SELECT StoreKey AS 'Id Loja',
    SUM(SalesQuantity) AS 'Qtd Total Vendido',
    SUM(ReturnQuantity) AS 'Qtd Total Devolvido'
FROM FactSales
GROUP BY StoreKey

--c)
SELECT channelKey AS 'Canal Venda',
    SUM(SalesAmount) AS 'Valor Total Vendido'
FROM FactSales
WHERE DateKey BETWEEN '20070101' AND '20071231'
GROUP BY channelKey
ORDER BY [Valor Total Vendido] DESC

-- 02.
--a)
SELECT ProductKey AS 'Id Produto',
    SUM(SalesAmount) AS 'Valor Total Vendas'
FROM FactSales
GROUP BY ProductKey
HAVING SUM(SalesAmount) > 5000000.00
ORDER BY [Valor Total Vendas] DESC

--b)
SELECT TOP (10) ProductKey AS 'Id Produto',
    SUM(SalesAmount) AS 'Valor Total Vendas'
FROM FactSales
GROUP BY ProductKey
ORDER BY [Valor Total Vendas] DESC

-- 03.
SELECT *
FROM FactOnlineSales

--a)
SELECT TOP (1) CustomerKey AS 'Id Cliente',
    SUM(SalesQuantity) AS 'Qtd Compras'
FROM FactOnlineSales
GROUP BY CustomerKey
ORDER BY [Qtd Compras] DESC

--b)
SELECT TOP (3) ProductKey AS 'Id Produto',
    SUM(SalesQuantity) AS 'Total Vendido'
FROM FactOnlineSales
WHERE CustomerKey = '19037'
GROUP BY ProductKey
ORDER BY [Total Vendido] DESC

-- 04.
SELECT *
FROM DimProduct

--a)
SELECT BrandName AS 'Nome Marca',
    COUNT(ProductKey) AS 'Qtd Total Produtos'
FROM DimProduct
GROUP BY BrandName
ORDER BY [Qtd Total Produtos] DESC

--b)
SELECT ClassName AS 'Nome Classe Produto',
    AVG(UnitPrice) AS 'Media Preco Unitario'
FROM DimProduct
GROUP BY ClassName
ORDER BY [Media Preco Unitario] DESC

--c)
SELECT ColorName AS 'Nome Cor',
    SUM(Weight) AS 'Soma Peso Produto'
FROM DimProduct
GROUP BY ColorName
ORDER BY [Soma Peso Produto] DESC

-- 05.
SELECT StockTypeName AS 'Tipo Produto',
    SUM(Weight) AS 'Soma Peso Produto'
FROM DimProduct
WHERE BrandName = 'Contoso'
GROUP BY StockTypeName
ORDER BY [Soma Peso Produto] DESC

-- 06.
SELECT BrandName AS 'Nome Marca',
    COUNT(DISTINCT ColorName) AS 'Qtd Cores'
FROM DimProduct
GROUP BY BrandName
ORDER BY [Qtd Cores] DESC

-- 07.
SELECT *
FROM DimCustomer

SELECT Gender AS 'Sexo Cliente',
    COUNT(CustomerKey) AS 'Qtd Total Clientes',
    AVG(YearlyIncome) AS 'Media Salarial'
FROM DimCustomer
WHERE CustomerType = 'Person'
GROUP BY Gender
ORDER BY [Media Salarial] DESC

-- 08.
SELECT Education AS 'Nivel Escolar',
    COUNT(CustomerKey) AS 'Qtd Total Clientes',
    AVG(YearlyIncome) AS 'Media Salarial'
FROM DimCustomer
WHERE CustomerType = 'Person'
GROUP BY Education
ORDER BY [Media Salarial] DESC

-- 09.
SELECT * FROM DimEmployee

SELECT DepartmentName AS 'Departamento',
    COUNT(EmployeeKey) AS 'Qtd Funcionarios'
FROM DimEmployee
WHERE [Status] = 'Current' -- EndDate IS NULL
GROUP BY DepartmentName
ORDER BY [Qtd Funcionarios] DESC

-- 10.
SELECT Title AS 'Cargo',
    SUM(VacationHours) AS 'Horas Ferias'
FROM DimEmployee
WHERE Gender = 'F' AND
DepartmentName IN ('Production','Marketing','Engineering', 'Finance')
AND
HireDate BETWEEN '1999-01-01' AND '2000-12-31'
GROUP BY Title
ORDER BY [Horas Ferias] DESC
