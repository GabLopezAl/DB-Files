USE AngelGabrielLopez
GO

CREATE TABLE AGLA.DIRECCION(
	ID INT,
	DIRECCION NVARCHAR(50)
)

INSERT INTO AGLA.DIRECCION VALUES(1,'21/09/2003')
SELECT * FROM AGLA.DIRECCION

ALTER TABLE AGLA.Datos_Personales ADD FECHA_NACIMIENTO NVARCHAR(50)