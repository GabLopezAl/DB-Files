USE AngelGabrielLopez
GO

INSERT INTO AGLA.Datos_Personales VALUES(1,'ANGEL GABRIEL','LOPEZ', 'ALVARADO')

SELECT * FROM AGLA.Datos_Personales

UPDATE AGLA.Datos_Personales SET FECHA_NACIMIENTO = '21/09/2003'
WHERE ID = 1