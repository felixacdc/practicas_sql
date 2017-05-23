-- Crear una base de datos
	CREATE DATABASE TestData;
-- Eliminar base de datos
	DROP DATABASE TestData;
-- Seleccionar base de datos
	USE TestData;
-- Crear tabla
	CREATE TABLE dbo.Products  
	   (ProductID int PRIMARY KEY NOT NULL,  
	    ProductName varchar(25) NOT NULL,  
	    Price money NULL,  
	    ProductDescription text NULL);
-- Crear tabla con una relacion
	CREATE TABLE TempSalesReason (
		TempID int NOT NULL, Name nvarchar(50),   
		CONSTRAINT FK_TempSales_SalesReason FOREIGN KEY (TempID)     
	    REFERENCES SalesReason (SalesReasonID)     
	    ON DELETE CASCADE    
	    ON UPDATE CASCADE    
	);
-- Crear relacion a una tabla existente
	ALTER TABLE TempSalesReason     
	ADD CONSTRAINT FK_TempSales_SalesReason FOREIGN KEY (TempID)     
	    REFERENCES SalesReason (SalesReasonID)     
	    ON DELETE CASCADE    
	    ON UPDATE CASCADE    
	; 
-- Modificar una tabla
	-- Agregarle un campo
	ALTER TABLE Customer ADD Gender char(1);
	-- Modificar un campo
		-- Renombrar
		ALTER TABLE Customer CHANGE Address Addr char(50);
		-- Cambiar tipo
		ALTER TABLE Nombre_Tabla ALTER COLUMN Nombre_Columna char(50) NULL
		-- Eliminar relacion
		ALTER TABLE Nombre_Tabla DROP CONSTRAINT PK_NombreClave
	-- Eliminar un campo
	ALTER TABLE Customer DROP COLUMN Gender;
-- Eliminar una tabla
	DROP TABLE Customer;
-- Truncar una tabla
	TRUNCATE TABLE Customer;

-- Crear vistas
	--Partitioned view as defined on Server1  
	CREATE VIEW Customers  
	AS  
	--Select from local member table.  
	SELECT *  
	FROM CompanyData.dbo.Customers_33  
	UNION ALL  
	--Select from member table on Server2.  
	SELECT *  
	FROM Server2.CompanyData.dbo.Customers_66  
	UNION ALL  
	--Select from mmeber table on Server3.  
	SELECT *  
	FROM Server3.CompanyData.dbo.Customers_99;  



-- Insertar datos a una tabla
	INSERT INTO Store_Information (Store_Name, Sales, Txn_Date)
	VALUES ('Los Angeles', 900, '10-Jan-1999');
-- Modificar datos de una tabla
	UPDATE Store_Information
	SET Sales = 500
	WHERE Store_Name = 'Los Angeles'
	AND Txn_Date = '08-Jan-1999';
-- Eliminar datos de una tabla
	DELETE FROM Store_Information
	WHERE Store_Name = 'Los Angeles';

-- Union de tablas
	-- UNION: solo selecciona los registros distintos si el registro se repite en las tablas solo lo selecciona una vez
		SELECT ProductModelID, Name  
		FROM Production.ProductModel  
		WHERE ProductModelID NOT IN (3, 4)  
		UNION  
		SELECT ProductModelID, Name  
		FROM dbo.Gloves  
		ORDER BY Name;  
	-- Inner Join
		SELECT columns
		FROM table1 
		INNER JOIN table2
		ON table1.column = table2.column;
	-- Group By
		SELECT ColumnA, ColumnB FROM T GROUP BY ColumnA, ColumnB;
		SELECT ColumnA + ColumnB FROM T GROUP BY ColumnA, ColumnB;
		SELECT ColumnA + ColumnB FROM T GROUP BY ColumnA + ColumnB;
		SELECT ColumnA + ColumnB + constant FROM T GROUP BY ColumnA, ColumnB;
	-- Having
		SELECT SalesOrderID, SUM(LineTotal) AS SubTotal  
		FROM Sales.SalesOrderDetail  
		GROUP BY SalesOrderID  
		HAVING SUM(LineTotal) > 100000.00  
		ORDER BY SalesOrderID;
	-- Like
		-- contenga la cadena
		select * from libros
		where autor like "%Borges%";
		-- empiese con la cadena
		select * from libros
		where titulo like 'M%';
		-- que no sea como
		select * from libros
		where titulo not like 'M%';
		-- el _ representa cualquier caracter
		select * from libros
  		where autor like "%Carrol_";
		-- ... like '[a-cf-i]%': busca cadenas que comiencen con a,b,c,f,g,h o i;
		-- ... like '[-acfi]%': busca cadenas que comiencen con -,a,c,f o i;
		-- ... like 'A[_]9%': busca cadenas que comiencen con 'A_9';
		-- ... like 'A[nm]%': busca cadenas que comiencen con 'An' o 'Am'.
	-- Between
		SELECT e.FirstName, e.LastName, ep.Rate  
		FROM HumanResources.vEmployee e   
		JOIN HumanResources.EmployeePayHistory ep   
		    ON e.BusinessEntityID = ep.BusinessEntityID  
		WHERE ep.Rate BETWEEN 27 AND 30  
		ORDER BY ep.Rate; 