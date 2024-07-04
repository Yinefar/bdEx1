use ALAN_TURIN
go

Create  procedure usp_listaArea
As
Select CodArea, NombreArea from AREA;

GO

Create  procedure usp_listaDepartamento
As
Select CodDepartamento, NombreDepartamento from DEPARTAMENTO;

GO

Create  procedure usp_getSecuenciaCurso
As
Select max(IdCurso)+1 as  Secuencia from CURSO;

GO

Create  procedure usp_listaCursos
As
Select C.IdCurso,
	   C.NombreCurso, 
	   C.CodArea, 
	   C.CodDepartamento,  
	   C.CantidadAlumno, 
	   C.EstadoCurso, 
	   C.HorarioCurso, 
	   A.NombreArea, 
	   D.NombreDepartamento
from CURSO C inner join AREA A on C.CodArea=A.CodArea
					inner join DEPARTAMENTO  D on C.CodDepartamento=D.CodDepartamento;
GO

Create  procedure usp_addCursos
@idCurso			int,
@nombreCurso		varchar(50),
@codArea			int,
@codDepartamento	int,
@cantidadAlumno		char(3),
@estadoCurso		varchar(15),
@horarioCurso		varchar(20)
As
Insert into CURSO
Values(@idCurso	,@nombreCurso,@codArea,@codDepartamento,@cantidadAlumno,@estadoCurso,@horarioCurso);

GO

Create  procedure usp_updateCursos
@idCurso			int,
@nombreCurso		varchar(50),
@codArea			int,
@codDepartamento	int,
@cantidadAlumno		char(3),
@estadoCurso		varchar(15),
@horarioCurso		varchar(20)
As
Update CURSO
Set NombreCurso=@nombreCurso , CodArea=@codArea , CodDepartamento=@codDepartamento , CantidadAlumno=@cantidadAlumno , EstadoCurso=@estadoCurso, HorarioCurso=@horarioCurso
where IdCurso=@idCurso;

GO

 Create procedure usp_deleteCursos
@idCurso	int
 As
 Delete CURSO
 where  IdCurso=@idCurso;

 go

 drop procedure usp_listaArea
 drop procedure usp_listaDepartamento
 drop procedure usp_getSecuenciaCurso
 drop procedure usp_listaCursos
 drop procedure usp_addCursos
 drop procedure usp_updateCursos
 drop procedure usp_deleteCursos


 select * from CURSO
 select * from [dbo].[AREA]


 EXEC usp_addCursos 1010, 'Introducción a la programación 2', 1, 101, '50', 'Activo', '9:00- 11:00'
 EXEC usp_listaArea
 exec usp_listaDepartamento