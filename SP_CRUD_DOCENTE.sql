use ALAN_TURIN
go



Create  procedure usp_getSecuenciaDocente
As
Select max(CodDocente)+1 as  Secuencia from DOCENTE;

GO

-----------------------------------------------------------------------------

Create  procedure usp_listaDocentes
As
Select D.CodDocente,
	   D.NomCompletoDocente, 
	   D.IdCurso, 
	   D.DireccionDocente,
	   D.TelefDocente,
	   C.NombreCurso
from DOCENTE D inner join CURSO C on D.IdCurso=C.IdCurso;					
GO
--------------------------------------------------------------------------------
Create  procedure usp_addDocentes
@codDocente	int,
@nombres	varchar(50),
@idCurso	int,
@direccion	varchar(30),
@fono		varchar(10)
As
Insert into DOCENTE
Values(@codDocente,@nombres,@idCurso,@direccion,@fono);
GO


-------------------------------------------------------------------------------------------

Create   procedure usp_updateDocentes
@codDocente	int,
@nombres	varchar(50),
@idCurso	int,
@direccion	varchar(30),
@fono		varchar(10)
As
Update DOCENTE
Set NomCompletoDocente=@nombres, IdCurso=@idCurso, DireccionDocente=@direccion,  TelefDocente=@fono
where CodDocente=@codDocente;

GO

------------------------------------------------------------------------------------------------------------

 Create procedure usp_deleteDocentes
@codDocente	varchar(10)
 As
 Delete DOCENTE
 where  CodDocente=@codDocente;

GO