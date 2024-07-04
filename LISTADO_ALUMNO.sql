use ALAN_TURIN
go
 
Create    procedure usp_listaAlumno
As
Select A.CodAlumno, 
	   A.NombreAlumno,
	   A.DireccionAlumno,
	   A.IdCurso, 
	   A.TelefonoAlumno,
	   C.NombreCurso
From ALUMNO A inner join CURSO C on A.IdCurso=C.IdCurso
order by A.CodAlumno


exec usp_listaAlumno