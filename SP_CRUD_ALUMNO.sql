use ALAN_TURIN
go


Create  procedure usp_listaCurso
As
Select IdCurso, NombreCurso from CURSO;

GO
---------------------------------------------------------------------------------------------
drop procedure usp_listaCurso

Create  procedure usp_getSecuenciaAlumno
As
Select max(CodAlumno)+1 as  Secuencia from ALUMNO;

GO
------------------------------------------------------------------------------------------------------
Create  procedure usp_addAlumnos
@codAlumno	int,
@nombres	varchar(50),
@direccion	varchar(60),
@idCurso	int,
@fono		varchar(24)
As
Insert into ALUMNO
Values(@codAlumno,@nombres,@direccion,@idCurso,@fono);

GO

----------------------------------------------------------------------------------------------------

Create   procedure usp_updateAlumnos
@codAlumno	int,
@nombres	varchar(50),
@direccion	varchar(60),
@idCurso	int,
@fono		varchar(24)
As
Update ALUMNO
Set NombreAlumno=@nombres, DireccionAlumno=@direccion, IdCurso=@idCurso , TelefonoAlumno=@fono
where CodAlumno=@codAlumno;

GO

---------------------------------------------------------------------------------------------------------

 Create procedure usp_deleteAlumnos
@codAlumno	varchar(10)
 As
 Delete ALUMNO
 where  CodAlumno=@codAlumno;

GO

