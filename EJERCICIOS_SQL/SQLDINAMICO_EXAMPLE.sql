----MONITOREAR 

----ALMACENADAS EN UNA VARIABLE QUE DEPSUES EJECUTAMOS -- SQLDINAMICO

--SELECT * FROM VENTAS

--EXEC ('SELECT 1 AS RESULTADO')

--EXEC SP_EXECUTESQL N'SELECT 1 AS RESULTADO'


--DECLARE @SQL1 VARCHAR(200)
--DECLARE @SQL2 NVARCHAR(200)

--SET @SQL1 = 'SELECT * FROM VENTAS'
--SET @SQL2 = 'SELECT * FROM VENTAS'

--EXEC SP_EXECUTESQL @SQL2
----EXEC (@SQL2)



--CREATE TABLE #DATOS_PUEBLA
--(
--	ESTADO NVARCHAR(50),
--	ID_CLIENTE BIGINT,
--	CATEGORIA NVARCHAR(50)
--)

--CREATE TABLE #DATOS_CDMX
--(
--	ESTADO NVARCHAR(50),
--	ID_CLIENTE BIGINT,
--	CATEGORIA NVARCHAR(50)
--)

--INSERT INTO #DATOS_PUEBLA VALUES ('PUEBLA', 1373672467, 'BRONCE')
--INSERT INTO #DATOS_PUEBLA VALUES ('PUEBLA', 1372333467, 'ORO')
--INSERT INTO #DATOS_PUEBLA VALUES ('PUEBLA', 1312372467, 'PLATA')
--INSERT INTO #DATOS_PUEBLA VALUES ('PUEBLA', 1373672467, 'BRONCE')
--INSERT INTO #DATOS_PUEBLA VALUES ('PUEBLA', 1373672467, 'ORO')
--INSERT INTO #DATOS_PUEBLA VALUES ('PUEBLA', 1373672467, 'PLATA')
--INSERT INTO #DATOS_PUEBLA VALUES ('PUEBLA', 1373672467, 'BRONCE')
--INSERT INTO #DATOS_PUEBLA VALUES ('PUEBLA', 1373672467, 'ORO')
--INSERT INTO #DATOS_PUEBLA VALUES ('PUEBLA', 1373672467, 'PLATA')
--INSERT INTO #DATOS_PUEBLA VALUES ('PUEBLA', 1373672467, 'BRONCE')

--INSERT INTO #DATOS_CDMX VALUES('CDMX', 374678657, 'BRONCE')
--INSERT INTO #DATOS_CDMX VALUES('CDMX', 374678657, 'ORO')
--INSERT INTO #DATOS_CDMX VALUES('CDMX', 374678657, 'PLATA')
--INSERT INTO #DATOS_CDMX VALUES('CDMX', 374678657, 'BRONCE')
--INSERT INTO #DATOS_CDMX VALUES('CDMX', 374678657, 'ORO')
--INSERT INTO #DATOS_CDMX VALUES('CDMX', 374678657, 'PLATA')
--INSERT INTO #DATOS_CDMX VALUES('CDMX', 374678657, 'BRONCE')
--INSERT INTO #DATOS_CDMX VALUES('CDMX', 374678657, 'ORO')
--INSERT INTO #DATOS_CDMX VALUES('CDMX', 374678657, 'PLATA')
--INSERT INTO #DATOS_CDMX VALUES('CDMX', 374678657, 'BRONCE')


--DECLARE @TABLA NVARCHAR(50), @CATEGORIA NVARCHAR(50), @SQL NVARCHAR(MAX)

--SET @TABLA = '#DATOS_CDMX'
--SET @CATEGORIA = 'BRONCE'

--SET @SQL = 'SELECT * FROM ' + @TABLA + ' WHERE CATEGORIA = ''' + @CATEGORIA + ''''

--SELECT @SQL

--EXEC SP_EXECUTESQL @SQL

----DROP TABLE #DATOS_CDMX
----DROP TABLE #DATOS_PUEBLA


--TRUNCATE TABLE INVENTARIO.dbo.PERSONA
----CREATE TABLE PERSONA
----(
----	ID INT, 
----	NOMBRE NVARCHAR(50),
----	APELLIDO NVARCHAR(50)
----)

--INSERT INTO INVENTARIO.dbo.PERSONA VALUES 
--(5, 'JOSE', 'GARCIA'),
--(2, 'EDUARDO', 'LOPEZ'),
--(8, 'LUIS', 'PEREZ'),
--(4, 'JORGE', 'OTIS'),
--(1, 'JUAN', 'WALIS'),
--(6, 'ROBERTO', 'ALVARADO'),
--(7, 'ANGEL', 'DURAN'),
--(3, 'FERNANDO', 'PEREZ'),
--(10, 'IVAN', 'FLORES'),
--(9, 'GABRIEL', 'HUERTA')

--SELECT * FROM PERSONA


--CREATE CLUSTERED INDEX NOMBRE ON TABLA
--(
	
--)

--CREATE NONCLUSTERED INDEX NOMBRE ON TABLA
--(
	
--)


--CREATE TRIGGER MENSAJE
--ON DBO.PERSONA
--FOR INSERT, UPDATE
--AS 
--BEGIN
--	PRINT 'REGISTRO INSERTARO O ACTUALIZADO CORRECTAMENTE'
--END

--UPDATE PERSONA SET NOMBRE = 'IVAN'
--WHERE NOMBRE = 'KIKE'

--ALTER TABLE TECNICO DROP CONSTRAINT FK_ID_EMPLEADO_1
--ALTER TABLE TECNICO DROP CONSTRAINT FK_ID_MAQUINA

--ALTER TABLE PLANTA DROP CONSTRAINT FK_ID_MAQUINA_1, FK_ID_PROCESO

--ALTER TABLE MAQUINA DROP CONSTRAINT FK_ID_EMPLEADO, FK_ID_PLANTA, FK_ID_PROCESO_1

--ALTER TABLE EMPLEADO DROP CONSTRAINT PK_ID_EMPLEADO

--ALTER TABLE MAQUINA DROP CONSTRAINT PK_ID_MAQUINA

--ALTER TABLE PLANTA DROP CONSTRAINT PK_ID_PLANTA

--ALTER TABLE PROCESO DROP CONSTRAINT PK_ID_PROCESO

--DROP TABLE EMPLEADO, MAQUINA, PLANTA, PROCESO, TECNICO

ALTER TRIGGER PRUEBA
ON ALUMNO
FOR UPDATE
AS
	PRINT 'SE ACTUALIZO CORRECTAMENTE UN REGSITRO'

SELECT * FROM ALUMNO

UPDATE ALUMNO SET NOMBRE = 'JESUS'
WHERE NOMBRE = 'HERNESTO'

