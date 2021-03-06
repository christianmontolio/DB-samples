CREATE DATABASE HUMANRESOURCES
USE HUMANRESOURCES;



--EMPLEADOS
CREATE TABLE EMPLEADOS
	(ID INT,
	 ID_EMPLEADO INT IDENTITY(1,1) NOT NULL,
	 NOMBRE VARCHAR(40),
	 APELLIDO VARCHAR(40),
	 TELEFONO VARCHAR(15),
	 DEPARTAMENTO VARCHAR(50),
	 CARGO VARCHAR(50),
	 FECHA_INGRESO DATE,
	 SALARIO INT,
	 STATUS_EMP VARCHAR(10),
	 CONSTRAINT PK_EMP PRIMARY KEY(ID))


--DEPARTAMENTOS
CREATE TABLE DEPARTAMENTOS
	(ID INT,
	 CODIGO_DEPARTAMENTO INT IDENTITY(1,1) NOT NULL,
	 NOMBRE VARCHAR(50),
	 CONSTRAINT PK_DEP PRIMARY KEY(ID))


--CARGOS
CREATE TABLE CARGO
	(ID INT,
	 CARGO VARCHAR(50),
	 CONSTRAINT PK_CAR PRIMARY KEY(ID))


--NOMINA
CREATE TABLE NOMINA
	(ID INT,
	 ANO INT,
	 MES INT,
	 MONTO_TOTAL INT,
	 CONSTRAINT PK_NOM PRIMARY KEY(ID),
	 CONSTRAINT CK_MES CHECK(MES>0 AND MES<13))


--SALIDA DE EMPLEADOS
CREATE TABLE SALIDA_EMPLEADOS
	(ID INT,
	 EMPLEADO VARCHAR(50),
	 TIPO_SALIDA VARCHAR(15),
	 MOTIVO VARCHAR(100),
	 FECHA_SALIDA DATE,
	 CONSTRAINT PK_SAL PRIMARY KEY(ID))


--VACACIONES
CREATE TABLE VACACIONES
	(ID INT,
	 EMPLEADO VARCHAR(50),
	 FECHA_INICIO DATE,
	 FECHA_FIN DATE,
	 ANO INT,
	 COMENTARIOS VARCHAR(100),
	 CONSTRAINT PK_VAC PRIMARY KEY(ID))
	

--PERMISOS
CREATE TABLE PERMISOS
	(ID INT,
	 EMPLEADO VARCHAR(50),
	 FECHA_INICIO DATE,
	 FECHA_FIN DATE,
	 COMENTARIOS VARCHAR(150),
	 CONSTRAINT PK_PER PRIMARY KEY(ID))


--LICENCIAS
CREATE TABLE LICENCIAS
	(ID INT,
	 EMPLEADO VARCHAR(50),
	 FECHA_INICIO DATE,
	 FECHA_FIN DATE,
	 MOTIVO VARCHAR(50),
	 COMENTARIOS VARCHAR(150),
	 CONSTRAINT PK_LIC PRIMARY KEY(ID))

	 


	 insert into EMPLEADOS values
		(1, 1,'Christian David','Montolio Disla','809-749-5409','IT','Programador Junior','3/2/2019','Activo'),
		(),


		select * from empleados

		use AdonysAgenda
drop database HUMANRESOURCES