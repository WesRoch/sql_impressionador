USE ContosoRetailDW

-- Total de qtd vendida e total devolvido
SELECT SUM(SalesQuantity) AS 'TotalVendido',
    SUM(ReturnQuantity) AS 'TotalDevolvido'
FROM FactSales

-- Usando o COUNT
SELECT COUNT(*) AS 'TotalProdutos'
FROM DimProduct

SELECT COUNT(ProductName) AS 'QtdProdutos'
FROM DimProduct

-- Como o size tem null, retornou menos 
SELECT COUNT(Size) AS 'QtdSize'
FROM DimProduct

-- qtd distinta de cores dos produtos
SELECT COUNT(DISTINCT ColorName)
FROM DimProduct

-- maior e menor preco dos produtos
SELECT MAX(UnitPrice) AS 'Custo Maximo',
    MIN(UnitPrice) AS 'Custo Minimo'
FROM DimProduct

-- media de salario dos clientes
SELECT AVG(YearlyIncome) AS 'MediaRendaAnual'
FROM DimCustomer

-- Modulo 05: Exercicios
-- 01.
SELECT SUM(SalesQuantity) AS 'Total Qtd Vendas',
    SUM(ReturnQuantity) AS 'Total Qtd Devolvida'
FROM FactSales
WHERE channelKey = 1

--02.
SELECT AVG(YearlyIncome) AS 'Media Salarial'
FROM DimCustomer
WHERE Occupation = 'Professional'

--03.
SELECT *
FROM DimStore

--a)
SELECT MAX(EmployeeCount) AS 'Loja + Func'
FROM DimStore

--b)
SELECT TOP (1) StoreName,
    EmployeeCount
FROM DimStore
ORDER BY EmployeeCount DESC

--c)
SELECT MIN(EmployeeCount) AS 'Loja - Func'
FROM DimStore

--d)
SELECT TOP (1) StoreName,
    EmployeeCount
FROM DimStore
WHERE EmployeeCount IS NOT NULL
ORDER BY EmployeeCount ASC

--4
SELECT * FROM DimEmployee
--a)

SELECT COUNT(Gender)
FROM DimEmployee

--b)
SELECT TOP (1) FirstName + ' ' + LastName AS 'Nome',
    EmailAddress AS 'Email',
    HireDate AS 'Data Contratacao'
FROM DimEmployee
WHERE Gender = 'M'
ORDER BY HireDate ASC

SELECT TOP (1) FirstName + ' ' + LastName AS 'Nome',
    EmailAddress AS 'Email',
    HireDate AS 'Data Contratacao'
FROM DimEmployee
WHERE Gender = 'F'
ORDER BY HireDate ASC

--5
SELECT * FROM DimProduct
--a)
SELECT COUNT(DISTINCT ColorName) AS 'Qtd Distinta Cores',
    COUNT(DISTINCT BrandName) AS 'Qtd Distinta Marcas',
    COUNT(DISTINCT ClassName) AS 'Qtd Distinta ClassesProdutos'
FROM DimProduct