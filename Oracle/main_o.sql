-- Crear tabla
	CREATE TABLE clientes
	(
		CodCliente    NUMBER(4) not null,
		CIF           VARCHAR2(15) not null,
		NombreCli     VARCHAR2(50),
		DireccionCli  VARCHAR2(50),
		TelefonoCli   VARCHAR2(9),
		FechaAlta     DATE,
		Facturacion   NUMBER(6,2)
	);
-- Crear tabla con clave primaria
	create table usuarios(
		nombre varchar2(20),
		clave varchar2(10),
		primary key(nombre)
	 );
	-- Nombrando la clave
		alter table libros
		add constraint PK_libros_codigo
		primary key(codigo);

		CREATE TABLE contacts
		( 
			contact_id number(10) not null,
			last_name varchar2(50) not null,
			first_name varchar2(50) not null,
			address varchar2(50),
			city varchar2(50),
			state varchar2(20),
			zip_code varchar2(10),
			CONSTRAINT contacts_pk PRIMARY KEY (contact_id)
		);
-- Relacion a una tabla
	alter table NOMBRETABLA1
	add constraint NOMBRERESTRICCION
	foreign key (CAMPOCLAVEFORANEA)
	references NOMBRETABLA2 (CAMPOCLAVEPRIMARIA);
-- Crear autoincrementable
	-- Crear Secuencia
		CREATE SEQUENCE cfab
		START WITH 1
		INCREMENT BY 1;
	-- Cuando se hace el insert llamar a la funcion nextval de la secuencia
		INSERT INTO Fabricantes (cod_fabricante, nombre, pais)
		VALUES (cfab.nextval, ‘Nintendo’, ‘Japon’);
	-- Llamar a la secuencia con un trigger
		CREATE TRIGGER TRIG_FAB
		BEFORE INSERT ON Fabricantes
		FOR EACH ROW
		BEGIN
		SELECT cfab.NEXTVAL INTO :NEW.cod_fabricante FROM DUAL;
		END;
-- Modificar una tabla
	-- Añadir una columna a una tabla:
		ALTER TABLE T_PEDIDOS ADD TEXTOPEDIDO Varchar2(35);
	-- Cambiar el tamaño de una columna en una tabla:
		ALTER TABLE T_PEDIDOS MODIFY TEXTOPEDIDO Varchar2(135);
	-- Hacer NOT NULL una columna en una tabla:
		ALTER TABLE T_PEDIDOS MODIFY (TEXTOPEDIDO NOT NULL);
	-- Eliminar una columna a una tabla:
		ALTER TABLE T_PEDIDOS DROP COLUMN TEXTOPEDIDO;
	-- Valor por defecto de una columna:
		ALTER TABLE T_PEDIDOS MODIFY TEXTOPEDIDO Varchar2(135) DEFAULT 'ABC...';
	-- Añade dos columnas:
		ALTER TABLE T_PEDIDOS ADD (SO_PEDIDOS_ID INT, TEXTOPEDIDO Varchar2(135));
-- Eliminar una tabla
	drop table NOMBRETABLA;

-- Crear vista
	CREATE VIEW view_dept_201 
	AS (SELECT emp_id,name,department,hire_date)
	FROM gdb.employees 
	WHERE department = 201;
	-- Otorgar privilegios a la vista
		GRANT SELECT
		ON rocket.view_dept_201
		TO mgr200;

-- Insertar datos
	INSERT INTO suppliers
	(supplier_id, supplier_name)
	VALUES
	(5000, 'Apple');
-- Modificar datos
	UPDATE customers
	SET last_name = 'Anderson'
	WHERE customer_id = 5000;
-- Eliminar datos
	DELETE FROM customers
	WHERE last_name = 'Smith';

-- Union
	-- El UNION operador, lo que elimina duplicar las filas seleccionadas.
	SELECT location_id, department_name "Department", TO_CHAR(NULL) "Warehouse" 
	FROM departments
	UNION
	SELECT location_id, TO_CHAR(NULL) "Department", warehouse_name 
	FROM warehouses;
	-- El UNIONoperador devuelve sólo filas distintas que aparecen en cualquiera resultado, 
	-- mientras que el UNION ALLoperador devuelve todas las filas.
	SELECT location_id  FROM locations 
	UNION ALL 
	SELECT location_id  FROM departments;
	-- El INTERSECToperador, que devuelve sólo las filas devueltas por ambas consultas
	SELECT product_id FROM inventories
	INTERSECT
	SELECT product_id FROM order_items;
	-- El MINUSoperador, que devuelve filas aparecen unicamente devueltos por la primera consulta, pero no por el segundo.
	SELECT product_id FROM inventories
	MINUS
	SELECT product_id FROM order_items;
-- Inner Join
	SELECT *
	FROM SAMP.EMPLOYEE INNER JOIN SAMP.STAFF
	ON EMPLOYEE.SALARY < STAFF.SALARY
-- Group By
	SELECT product, SUM(sale) AS "Total sales"
	FROM order_details
	GROUP BY product;
-- Having
	SELECT department, SUM(sales) AS "Total sales"
	FROM order_details
	GROUP BY department
	HAVING SUM(sales) > 25000;
-- Like
	-- Comiense con la cadena
	SELECT last_name
	FROM customers
	WHERE last_name LIKE 'Ap%';
	-- Dentro de la cadena
	SELECT last_name
	FROM customers
	WHERE last_name LIKE '%er%';
	-- el _ representa cualquier caracter
	SELECT supplier_name
	FROM suppliers
	WHERE supplier_name LIKE 'Sm_th';
-- Between
	SELECT *
	FROM customers
	WHERE customer_id BETWEEN 4000 AND 4999;
