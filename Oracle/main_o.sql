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

-- Eliminar una tabla
	drop table NOMBRETABLA;
