use ProyectoFinal

SELECT * FROM Empleado

CREATE VIEW ejemplo1 as
SELECT COUNT(iIdEmp) as Personas, vNombre as Nombre
FROM Empleado
GROUP BY vNombre

CREATE VIEW ejemplo2 as
SELECT vNombre as Nombre, dFechaDeNac as Cumpleaños
FROM Empleado
WHERE dFechaDeNac = '1996-12-06'
GROUP BY vNombre, dFechaDeNac



create view ejemplo3 as
SELECT vNombreCompleto as NombreCompleto, vDomicilio as Domicilio
FROM Empleado
WHERE vApellidoPaterno = 'Gimenez'
GROUP BY vNombreCompleto, vDomicilio, vNombre

create view ejemplo4 as 
SELECT vDomicilio as Domicilio, vTelefono as Telefono
FROM Empleado
WHERE vApellidoMaterno = 'Rodriguez' or vApellidoPaterno = 'Rodriguez' 
GROUP BY vDomicilio, vTelefono, iIdEmp

create view ejemplo5 as
SELECT COUNT(cStatus) as PersonasActivas, iIdEmp as ID
FROM Empleado
WHERE dFechaDeNac = '1995-01-01'
GROUP BY cStatus, iIdEmp

create view ejemplo6 as
SELECT vNombreCompleto, iIdEmp
FROM Empleado
GROUP BY vNombreCompleto, iIdEmp

create view ejemplo7 as
SELECT vNombre, vTelefono
FROM Empleado
WHERE iIdEmp BETWEEN 50 AND 59
GROUP BY iIdEmp, vNombre, vTelefono

create view ejemplo8 as
SELECT COUNT(iIdEmp) as ID, vNombre
FROM Empleado
GROUP BY vNombre
HAVING COUNT(iIdEmp) > 1

create view ejemplo9 as
SELECT COUNT(iIdEmp) as ID, vApellidoPaterno
FROM Empleado
GROUP BY vApellidoPaterno
HAVING COUNT(iIdEmp) > 1

create view ejemplo10 as 
SELECT COUNT(iIdEmp) as ID, vTelefono
FROM Empleado
GROUP BY vTelefono
HAVING COUNT(vTelefono) > 1

create view ejemplo11 as
SELECT Ticket.iIdTicket as IDT, Empleado.iIdEmp as IDE, Empleado.vNombreCompleto as NCE
FROM Ticket
INNER JOIN Empleado 
ON Ticket.iIdEmp = Empleado.iIdEmp;

create view ejemplo12 as
SELECT Reservacion.iIdReservacion, Cliente.vNombre
FROM Reservacion
LEFT JOIN Cliente
ON Reservacion.vNomCliente = Cliente.vNombre


create view ejemplo13 as
SELECT Ingrediente.iIdIngred, Proveedor.vNomProv
FROM Ingrediente
LEFT JOIN Proveedor
ON Ingrediente.iIdProv = Proveedor.iIdProv

create view ejemplo14 as
SELECT Ticket.iIdReservacion, Empleado.vNombreCompleto
FROM Ticket
LEFT JOIN Empleado
ON Ticket.iIdReservacion = Empleado.iIdEmp

create view ejemplo15 as
SELECT Platillo.mPrecio, Ingrediente.vNomIngred
FROM Platillo
LEFT JOIN Ingrediente
ON Platillo.iIdIngred = Ingrediente.iIdIngred