USE MASTER
GO
IF DB_ID('ACADEMY_ALAN_TURIN') IS NOT NULL
	BEGIN
	DROP DATABASE ACADEMY_ALAN_TURIN
END
GO

CREATE DATABASE ALAN_TURIN
	ON (NAME=BDALANTURIN_PRI,SIZE=10MB, FILEGROWTH= 25%,FILENAME='C:\SQLSERVER\PROYECTO4CICLO.MDF')
	LOG ON (NAME=BDALANTURIN_LOG,SIZE=10MB, FILENAME = 'C:\SQLSERVER\PROYECTO4CICLO.LOG.LDF')
GO

USE ALAN_TURIN
GO
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

USE ALAN_TURIN
GO
CREATE TABLE AREA
(
CodArea int PRIMARY KEY NOT NULL,
NombreArea VARCHAR(50)NOT NULL,
)
GO
---------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
CREATE TABLE DEPARTAMENTO
(
CodDepartamento int PRIMARY KEY NOT NULL,
NombreDepartamento VARCHAR(40)NOT NULL,
)
GO
----------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

CREATE TABLE CURSO
(
IdCurso  int PRIMARY KEY NOT NULL,
NombreCurso VARCHAR(50) NOT NULL UNIQUE,
CodArea int FOREIGN KEY REFERENCES AREA(CodArea) NULL,
CodDepartamento int FOREIGN KEY REFERENCES DEPARTAMENTO(CodDepartamento) NULL,
CantidadAlumno CHAR (3)NOT NULL,
EstadoCurso VARCHAR(15) NOT NULL,
HorarioCurso VARCHAR(20)NOT NULL
)
GO
------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

CREATE TABLE ALUMNO
(
CodAlumno int PRIMARY KEY NOT NULL,
NombreAlumno VARCHAR(50) NOT NULL,
DireccionAlumno VARCHAR(60) NOT NULL,
IdCurso  int FOREIGN KEY REFERENCES CURSO(IdCurso)NOT NULL,
TelefonoAlumno  VARCHAR(24)NOT NULL,
)
GO

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------


CREATE TABLE DOCENTE
(
CodDocente int PRIMARY KEY NOT NULL,
NomCompletoDocente VARCHAR(50) NOT NULL,
IdCurso int FOREIGN KEY REFERENCES CURSO(IdCurso) NOT NULL,
DireccionDocente VARCHAR(30) NOT NULL,
TelefDocente VARCHAR(10)NOT NULL
)
GO


-----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

INSERT INTO AREA (CodArea, NombreArea)
VALUES (1, 'Tecnología de la Información'),
       (2, 'Lenguas y Literaturas'),
       (3, 'Ciencias Básicas'),
       (4, 'Ciencias Sociales y del Comportamiento'),
       (5, 'Humanidades'),
       (6, 'Ciencias Económicas y Administrativas'),
       (7, 'Ciencias Ambientales y de la Tierra'),
       (8, 'Ciencias Naturales y Exactas'),
       (9, 'Artes y Diseño');
      

INSERT INTO DEPARTAMENTO (CodDepartamento, NombreDepartamento)
VALUES (101, 'Ciencias de la Computación'),
       (202, 'Inglés'),
       (303, 'Matemáticas'),
       (404, 'Psicología'),
       (505, 'Historia'),
       (606, 'Economía'),
       (707, 'Geografía'),
       (808, 'Química'),
       (909, 'Arte');
     


INSERT INTO CURSO (IdCurso, NombreCurso, CodArea, CodDepartamento, CantidadAlumno, EstadoCurso, HorarioCurso)
VALUES (1001, 'Introducción a la Programación', 1, 101, '20', 'Activo', '8:00 AM - 10:00 AM'),
       (2002, 'Inglés', 2, 202, '25', 'Activo', '2:00 PM - 4:00 PM'),
       (3003, 'Cálculo I', 3, 303, '30', 'Activo', '10:00 AM - 12:00 PM'),
       (4004, 'Introducción a la Psicología', 4, 404, '15', 'Activo', '8:00 AM - 10:00 AM'),
       (5005, 'Historia del Mundo I', 5, 505, '18', 'Inactivo', '2:00 PM - 4:00 PM'),
       (6006, 'Microeconomía', 6, 606, '22', 'Activo', '10:00 AM - 12:00 PM'),
       (7007, 'Geografía Física', 7, 707, '12', 'Activo', '10:00 AM - 12:00 PM'),
	   (8008, 'Química Orgánica', 8, 808, '12', 'Activo', '10:00 AM - 12:00 PM'),
	   (9009, 'Fotografía Digital', 9, 909, '12', 'Activo', '10:00 AM - 12:00 PM'),
	   (9010, 'Química OrgánicaII', 8, 808, '24', 'Activo', '16:00 AM - 17:00 PM');

INSERT INTO ALUMNO (CodAlumno, NombreAlumno, DireccionAlumno, IdCurso, TelefonoAlumno)
VALUES 
    (001, 'Juan Perez', 'Av. Los Conquistadores 123', 1001, '987654321'),
    (002, 'María Torres', 'Calle Los Pinos 456', 2002, '986532147'),
    (003, 'Pedro Rodriguez', 'Jr. Los Geranios 789', 3003, '981234567'),
    (004, 'Ana Gutiérrez', 'Av. Las Flores 456', 4004, '987654321'),
    (005, 'Luisa Morales', 'Calle Los Olivos 456', 5005, '986532147'),
    (006, 'Carlos Ramírez', 'Jr. Las Orquídeas 123', 6006, '981234567'),
    (007, 'Javier Flores', 'Av. Los Girasoles 789', 7007, '987654321'),
    (008, 'Isabel García', 'Calle Las Margaritas 789', 8008, '986532147'),
    (009, 'Miguel Castro', 'Jr. Los Nardos 123', 9009, '981234567'),
	(010, 'Ana Garcia', 'Avenida 111, Pueblo', 2002, '555-2345'),
	(011, 'Raul Martinez', 'Calle 222, Ciudad', 5005, '555-6789'),
	(012, 'Lucia Sanchez', 'Plaza Mayor, Villa', 6006, '555-3456'),
	(013, 'Jose Jimenez', 'Calle 333, Ciudad', 8008, '555-7890'),
	(014, 'Isabel Diaz', 'Avenida 444, Pueblo', 7007, '555-1234'),
	(015, 'Daniel Torres', 'Plaza del Ayuntamiento, Villa', 2002, '555-5678'),
	(016, 'Sara Perez', 'Calle 555, Ciudad', 3003, '555-9876'),
	(017, 'Miguel Gomez', 'Avenida 666, Pueblo', 4004, '555-4321'),
	(018, 'Laura Rodriguez', 'Plaza de la Constitucion, Villa', 5005, '555-8765'),
	(019, 'Manuel Hernandez', 'Calle 777, Ciudad', 1001, '555-2345'),
	(020, 'Paula Garcia', 'Avenida 888, Pueblo', 8008, '555-6789'),
	(021, 'Antonio Martinez', 'Plaza de España, Villa', 3003, '555-3456'),
	(022, 'Carmen Sanchez', 'Calle 999, Ciudad', 7007, '555-7890'),
	(023, 'Pablo Jimenez', 'Avenida 000, Pueblo', 2002, '555-1234'),
	(024, 'Elena Diaz', 'Plaza de la Merced, Villa', 3003, '555-5678');
  


  INSERT INTO DOCENTE (CodDocente, NomCompletoDocente, IdCurso, DireccionDocente, TelefDocente)
VALUES 
    (0001, 'Carlos Vargas', 1001, 'Av. Los Conquistadores 123', '998765432'),
    (0002, 'Laura García', 2002, 'Calle Los Pinos 456', '996532147'),
    (0003, 'Mario Torres', 3003, 'Jr. Los Geranios 789', '991234567'),
    (0004, 'Elena Fernández', 4004, 'Av. Las Flores 456', '997654321'),
    (0005, 'Juanita Huamaní', 5005, 'Calle Los Olivos 456', '996532147'),
    (0006, 'Pablo Mendoza', 6006, 'Jr. Las Orquídeas 123', '991234567'),
    (0007, 'Carmen Gómez', 7007, 'Av. Los Girasoles 789', '997654321'),
    (0008, 'Julio César Torres', 8008, 'Calle Las Margaritas 789', '996532147'),
    (0009, 'Marcela Rojas', 9009, 'Jr. Los Nardos 123', '991234567'),
	(0010, 'Jose Garcia', 1001, 'Calle cannabis, #345', '6677889900'),
	(0011, 'Ana Ortiz', 2002, 'Calle magica, #678', '1122334455'),
	(0012, 'Jorge Hernandez', 3003, 'Calle saturno, #901', '9988776655'),
	(0013, 'Sofia Gomez', 4004, 'Calle 8, #234', '8899001122'),
	(0014, 'Carlos Fernandez', 5005, 'Calle 9, #567', '7766554433'),
	(0015, 'Laura Perez', 6006, 'Calle 10, #890', '5544332211'),
	(0016, 'Felipe Rodriguez', 7007, 'Calle pluton, #234', '6677889900'),
	(0017, 'Elena Ramirez', 8008, 'Calle marcianos, #567', '1122334455'),
	(0018, 'Raul Martinez', 9009, 'Calle marte, #890', '9988776655'),
	(0019, 'Gloria Garcia', 1001, 'Calle 14, #123', '8899001122'),
	(0020, 'Oscar Ortiz', 2002, 'Calle venus, #456', '7766554433'),
	(0021, 'Julia Hernandez', 3003, 'Calle 16, #789', '5544332211'),
	(0022, 'Mauricio Gomez', 4004, 'Calle luna, #012', '6677889900'),
	(0023, 'Lucia Fernandez', 5005, 'Calle 18, #345', '965816044'),
	(0024, 'Roberto Perez', 6006, 'Calle huancavelica, #678', '9988776655'),
	(0025, 'Camila Rodriguez', 7007, 'Calle huancayo, #901', '8899001122');


DROP TABLE AREA
DROP TABLE DEPARTAMENTO
DROP TABLE CURSO
DROP TABLE ALUMNO
DROP TABLE DOCENTE

SELECT * FROM AREA
SELECT * FROM DEPARTAMENTO
SELECT * FROM CURSO
SELECT * FROM ALUMNO
SELECT * FROM DOCENTE