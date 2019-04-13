use ProyectoFinal


create table tb_clientesuma(

	suma int
	
)


CREATE TRIGGER trg_UserAdd ON Cliente
FOR INSERT
AS
BEGIN

DECLARE @Contador INT;
SET @Contador = (SELECT COUNT(1) FROM tb_clientesuma)

IF @Contador = 0
    INSERT INTO tb_clientesuma(suma) VALUES(1);
ELSE
    UPDATE tb_clientesuma SET suma = suma + 1;

END

create table tb_trigger2(
	suma int,
	nota varchar(50)
)


CREATE TRIGGER trg_UserAdd1 ON Cliente
FOR INSERT
AS
BEGIN

DECLARE @Contador int;
DECLARE @nota varchar(50);
SET @Contador = (SELECT COUNT(1) FROM tb_clientesuma)
SET @nota = 'Se a añadido correctamente el usuario'

IF @Contador = 0
    INSERT INTO tb_clientesuma(suma) VALUES(1);
ELSE
    UPDATE tb_clientesuma SET suma = suma + 1;
	insert into tb_trigger2(suma,nota) values(@contador,@nota);

END

set identity_insert Cliente on
insert into Cliente(iIdCliente,vNombre,vApellidoPaterno,vApellidoMaterno,vTelefono,vDomicilio) values(12,'Tomas','Urreta','Gallegos','84848484','Alfonso Reyes #12')

select * from Cliente

select * from tb_clientesuma
select * from tb_trigger2


create procedure SP_1
as 
select * from ejemplo1
go

create procedure SP_2
as 
select * from ejemplo2
go

create procedure SP_3
as 
select * from ejemplo3
go

create procedure SP_4
as 
select * from ejemplo4
go

create procedure SP_5
as 
select * from ejemplo5
go

create procedure SP_6
as 
select * from ejemplo6
go

create procedure SP_7
as 
select * from ejemplo7
go

create procedure SP_8
as 
select * from ejemplo8
go

create procedure SP_9
as 
select * from ejemplo9
go

create procedure SP_10
as 
select * from ejemplo10
go