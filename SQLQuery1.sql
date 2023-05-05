USE ContosoRetailDW

-- Selecione as coulnas ID do produto e nome do produto da tabela de produto
SELECT ProductKey
	,ProductName
FROM DimProduct

SELECT StoreKey
	,StoreName
	,StorePhone
FROM DimStore

-- Selecione as 10 primeiras linhas da tabela de Produtos - TOP (N)
SELECT TOP (10) *
FROM DimProduct

-- Selecione as 10% primeiras linhas da tabela de Clientes - TOP (N) PERCENT
SELECT TOP (10) PERCENT *
FROM DimCustomer

-- Selecione os valores distintos da coluna DepartamentName da tabela dimEmployee
SELECT DISTINCT DepartmentName
FROM DimEmployee

-- Selecione as 3 colunas da tabela dimProduct: ProductName, BrandName e ColorName, e use
-- o comando AS (aliasing)
SELECT ProductName AS 'Produto'
	,BrandName AS 'Marca'
	,ColorName AS 'Cor'
FROM DimProduct

-- Módulo 02: Exercícios

-- 1a. Selecione todos os produtos cadastrados na base
SELECT ProductKey
	,ProductName
FROM DimProduct


-- 1b. Selecione todos os clientes cadastrados na base: nao tem 19.500 clientes,
-- esse número reduziu
SELECT CustomerKey
	,FirstName + ' ' + LastName AS FullName
FROM DimCustomer


-- 2a. Selecione as colunas: CustomeyKey, FirstName, EmailAddress, Birthdate da tabela
--DimCustomer
SELECT CustomerKey
	,FirstName
	,EmailAddress
	,Birthdate
FROM DimCustomer

-- 2b. Renomeie as colunas do exercicio anterior usando o AS
SELECT CustomerKey AS 'Chave Primaria'
	,FirstName AS 'Primeiro Nome'
	,EmailAddress AS 'Email'
	,Birthdate 'Data de Nascimento'
FROM DimCustomer

-- 3a. Retorne uma tabela com os 10 primeiros clientes da tabela DimCustomer (todas as
-- colunas)
SELECT TOP (100) *
FROM DimCustomer

-- 3b. Retorne 10% das linhas da tabela DimCustomer (todas as colunas)
SELECT TOP (20) PERCENT *
FROM DimCustomer

-- 3c. Retorne a questao A mas apenas as colunas FirstName, EmailAddress, BirthDate
SELECT TOP (100) FirstName
	,EmailAddress
	,BirthDate
FROM DimCustomer

-- 3d. Renomeie a questão 3c usando o AS para portugues
SELECT TOP (100) FirstName AS 'Primeiro Nome'
	,EmailAddress AS 'Email'
	,BirthDate 'Data de Nascimento'
FROM DimCustomer

-- 4. Retorne apenas os nomes dos fornecedores da tabela DimProduct e renomeie
SELECT DISTINCT Manufacturer as 'Fornecedor'
FROM DimProduct

-- 5. Descubra se algum produto ainda nao foi vendido
SELECT DISTINCT ProductKey
FROM factSales

-- or
SELECT *
FROM DimProduct
WHERE AvailableForSaleDate IS NULL

-- Módulo 04
SELECT TOP (100) *
FROM DimStore
ORDER BY EmployeeCount ASC

-- Selecione as 10 primeiras linhas da tb DimProduct e ordene de acordo com a UnitCost

SELECT TOP (10) ProductName
	,UnitCost
	,Weight
FROM DimProduct
ORDER BY UnitCost DESC, Weight DESC

--
SELECT TOP (1) UnitPrice
FROM DimProduct
ORDER BY UnitPrice DESC

-- Selecione os produtos que tem um preço unitario maior que 1000
SELECT ProductName AS 'Nome do Produto'
	, UnitPrice AS 'Preço Unitario'
FROM DimProduct
WHERE UnitPrice >= 1000
ORDER BY UnitPrice DESC

-- Selecione os produtos que sao da marca fabrikam e os produtos pretos
SELECT *
FROM DimProduct
WHERE BrandName = 'Fabrikam'

SELECT *
FROM DimProduct
WHERE ColorName = 'Black'

-- Selecione os produtos que sao da marca frabikam E de cor preta
SELECT *
FROM DimProduct
WHERE BrandName = 'Fabrikam'
	AND ColorName = 'Black'

--Selecione os produtos que sao da marca contoso OU de cor branca
SELECT *
FROM DimProduct
WHERE BrandName = 'Contoso'
	OR ColorName = 'White'

-- Selecione os produtos que NAO sao do departamento Marketing
SELECT *
FROM DimEmployee
WHERE NOT DepartmentName = '"Marketing'


-- Selecione todas as linhas da tabela DimEmployee de funcionarios do sexo feminino E do departamento de finanças
SELECT *
FROM DimEmployee
WHERE Gender = 'F'
	AND DepartmentName = 'Finance'


-- Selecione todas as linhas da tabela DimProduct de produtos da marca Contoso E da cor vermelha E que tenham um UnitPrice maior ou igual a $100
SELECT *
FROM DimProduct
WHERE BrandName = 'Contoso'
	AND ColorName = 'Red'
	AND UnitPrice >= 100

-- Selecione todas as linhas da tabela dimProduct com produtos da marca Litware ou da marca Fabrikam ou da cor preta
SELECT *
FROM DimProduct
WHERE BrandName = 'Litware'
	OR BrandName = 'Fabrikam'
	OR ColorName = 'Black'

-- Selecione todas as linhas da tabela DimSalesTErritory onde o continente é a Europa mas o país NAO é igual a Italia
SELECT *
FROM DimSalesTerritory
WHERE SalesTerritoryGroup = 'Europe'
	AND NOT SalesTerritoryCountry = 'Italy'

-- Selecione todas as linhas da tabela DimProduct onde a cor do Produto pode ser igual a Preto ou vermelho MAS a marca deve ser obrigatoriamente igual a Fabrikam

SELECT *
FROM DimProduct
WHERE (
		ColorName = 'Black'
		OR ColorName = 'Red'
		)
	AND BrandName = 'Fabrikam'

SELECT *
FROM DimProduct
WHERE 
	BrandName = 'Fabrikam'
	AND (
		ColorName = 'Black'
		OR ColorName = 'Red'
		)

-- Selecione todas as linhas da tabela dimProduct onde a Cor é Prata, Azul, Branco, VErmelho e Preto
SELECT *
FROM DimProduct
WHERE ColorName IN (
		'Silver'
		,'Blue'
		,'White'
		,'Red'
		,'Black'
		)

-- Selecione apenas os produtos que sao MP3 Player

SELECT *
FROM DimProduct
WHERE ProductName LIKE '%MP3 Player%' 

-- Selecione apenas os produtos que começam com Type

SELECT *
FROM DimProduct
WHERE ProductDescription LIKE 'Type%'

-- Selecione apenas os produtos que TERMINAM com WMA

SELECT *
FROM DimProduct
WHERE ProductDescription LIKE '%WMA'

-- Selecione apenas os produtos que tem um preço entre 50 e 100

SELECT *
FROM DimProduct
WHERE UnitPrice BETWEEN 50
		AND 100

-- Selecione apenas os produtos que NAO tem um preço entre 50 e 100

SELECT *
FROM DimProduct
WHERE UnitPrice NOT BETWEEN 50
		AND 100

-- Selecione apenas os funcionarios que foram contratados entre o ano de 2000

SELECT *
FROM DimEmployee
WHERE HireDate BETWEEN '2000-01-01'
		AND '2000-12-31'

-- Selecione apenas as empresas 

SELECT *
FROM DimCustomer
WHERE CompanyName IS NOT NULL

-- selecione apenas as pessoas físicas

SELECT *
FROM DimCustomer
WHERE CompanyName IS NULL

-- Módulo 04 - exercícios
-- 1.
SELECT TOP (100) *
FROM FactSales
ORDER BY SalesAmount DESC

--2.
SELECT TOP (10) *
FROM DimProduct
ORDER BY UnitPrice DESC
	,Weight DESC
	,ColorID DESC

--3.
--a.
SELECT ProductName
	,Weight
	,WeightUnitMeasureID
FROM DimProduct
WHERE Weight >= 100

--b. 
SELECT ProductName as 'Produto'
	,Weight as 'Peso'
	,WeightUnitMeasureID 'Unidade de Medida do Peso'
FROM DimProduct
WHERE Weight >= 100

--c. 
SELECT ProductName as 'Produto'
	,Weight as 'Peso'
	,WeightUnitMeasureID 'Unidade de Medida do Peso'
FROM DimProduct
WHERE Weight >= 220.462
ORDER BY Weight DESC

--4.
--a.
SELECT DISTINCT StoreName
	,OpenDate
	,EmployeeCount
FROM DimStore

--b
SELECT DISTINCT StoreName AS 'Loja'
	,OpenDate AS 'Abertura'
	,EmployeeCount AS 'Qtde Funcionarios'
FROM DimStore

--c
SELECT DISTINCT StoreName AS 'Loja'
	,OpenDate AS 'Abertura'
	,EmployeeCount AS 'Qtde Funcionarios'
FROM DimStore
WHERE CloseDate IS NULL

--5.
SELECT ProductKey
	,ProductName
FROM DimProduct
WHERE ProductName LIKE '%Home Theater%'
	AND BrandName = 'Litware'
	AND AvailableForSaleDate = '2009-03-15'

--6.
--a.
SELECT *
FROM DimStore
WHERE Status = 'Off'

--b.
SELECT *
FROM DimStore
WHERE CloseDate IS NOT NULL

--7.
SELECT DISTINCT StoreName
	,EmployeeCount
FROM DimStore
WHERE EmployeeCount BETWEEN 1
		AND 325
ORDER BY EmployeeCount DESC

--8
SELECT ProductKey
	,ProductName
	,UnitPrice
FROM DimProduct
WHERE ProductDescription LIKE '%LCD%'
ORDER BY UnitPrice DESC

--9.
SELECT DISTINCT ProductName
FROM DimProduct
WHERE ColorName IN (
		'Green'
		,'Orange'
		,'Black'
		,'Silver'
		,'Pink'
		)
	AND BrandName IN (
		'Contoso'
		,'Litware'
		,'Fabrikam'
		)

--10.
SELECT ProductName
	,UnitPrice
FROM DimProduct
WHERE BrandName = 'Contoso'
	AND ColorName = 'Silver'
	AND (UnitPrice BETWEEN 10 AND 30)
ORDER BY UnitPrice DESC

-- Módulo 05 - Funções de Agregação

SELECT SUM(SalesQuantity) AS 'Total Vendido'
	,SUM(ReturnQuantity) AS 'Total Devolvido'
FROM FactSales

SELECT COUNT(*) AS 'Total de Produtos'
FROM DimProduct

SELECT COUNT(ProductName) AS 'Qtd Produtos'
FROM DimProduct
