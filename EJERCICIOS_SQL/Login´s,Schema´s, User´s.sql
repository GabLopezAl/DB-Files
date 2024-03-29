--Ejemplos de creacion de User's, Login's, Schema's

CREATE SCHEMA RecursosHumanos
USE ESCUELA


CREATE TABLE RecursosHumanos.Empleado(
	ID INT,
	NOMBRE NVARCHAR(50),
	AP_PATERNO NVARCHAR(50),
	AP_MATERNO NVARCHAR(50),
)

CREATE LOGIN Director_RH
WITH PASSWORD = N'1234'

CREATE LOGIN Gerente_produccion
WITH PASSWORD = N'abcd'

USE ESCUELA
GO

CREATE USER Dir_RH FOR LOGIN Director_RH
WITH DEFAULT_SCHEMA = RecursosHumanos

GRANT SELECT, INSERT
ON SCHEMA :: RecursosHumanos
TO Dir_RH
WITH GRANT OPTION 
GO

ALTER AUTHORIZATION ON DATABASE :: ESCUELA TO Director_RH

--CREACION DE OTRO USUARIO CON SU RESPECTIVA ASIGNACION DE PERMISOS
USE PERSONAL
GO

CREATE USER Ger_Produccion FOR LOGIN Gerente_produccion
WITH DEFAULT_SCHEMA = RecursosHumanos

GRANT SELECT
ON SCHEMA :: RecursosHumanos
TO Ger_Produccion
WITH GRANT OPTION
GO

