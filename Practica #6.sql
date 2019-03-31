use ProyectoFinal

SELECT * FROM Empleado

SELECT COUNT(iIdEmp) as Personas, vNombre as Nombre
FROM Empleado
GROUP BY vNombre
ORDER BY COUNT(iIdEmp) DESC;

SELECT vNombre as Nombre, dFechaDeNac as Cumpleaños
FROM Empleado
WHERE dFechaDeNac = '1996-12-06'
GROUP BY vNombre, dFechaDeNac
ORDER BY vNombre DESC;

SELECT vNombreCompleto as NombreCompleto, vDomicilio as Domicilio
FROM Empleado
WHERE vApellidoPaterno = 'Gimenez'
GROUP BY vNombreCompleto, vDomicilio, vNombre
ORDER BY vNombre ASC;

SELECT vDomicilio as Domicilio, vTelefono as Telefono
FROM Empleado
WHERE vApellidoMaterno = 'Rodriguez' or vApellidoPaterno = 'Rodriguez' 
GROUP BY vDomicilio, vTelefono, iIdEmp
ORDER BY iIdEmp DESC;

SELECT COUNT(cStatus) as PersonasActivas, iIdEmp as ID
FROM Empleado
WHERE dFechaDeNac = '1995-01-01'
GROUP BY cStatus, iIdEmp
ORDER BY iIdEmp

SELECT vNombreCompleto, iIdEmp
FROM Empleado
GROUP BY vNombreCompleto, iIdEmp
ORDER BY vNombreCompleto ASC;

SELECT vNombre, vTelefono
FROM Empleado
WHERE iIdEmp BETWEEN 50 AND 59
GROUP BY iIdEmp, vNombre, vTelefono
ORDER BY iIdEmp DESC;

SELECT COUNT(iIdEmp), vNombre
FROM Empleado
GROUP BY vNombre
HAVING COUNT(iIdEmp) > 1

SELECT COUNT(iIdEmp), vApellidoPaterno
FROM Empleado
GROUP BY vApellidoPaterno
HAVING COUNT(iIdEmp) > 1
ORDER BY vApellidoPaterno ASC;

SELECT COUNT(iIdEmp), vTelefono
FROM Empleado
GROUP BY vTelefono
HAVING COUNT(vTelefono) > 1
ORDER BY vTelefono ASC;

SELECT Ticket.iIdTicket as IDT, Empleado.iIdEmp as IDE, Empleado.vNombreCompleto as NCE
FROM Ticket
INNER JOIN Empleado 
ON Ticket.iIdEmp = Empleado.iIdEmp;

SELECT Reservacion.iIdReservacion, Cliente.vNombre
FROM Reservacion
LEFT JOIN Cliente
ON Reservacion.vNomCliente = Cliente.vNombre
ORDER BY Cliente.vNombre ASC;


SELECT Ingrediente.iIdIngred, Proveedor.vNomProv
FROM Ingrediente
LEFT JOIN Proveedor
ON Ingrediente.iIdProv = Proveedor.iIdProv
ORDER BY Proveedor.vNomProv ASC;

SELECT Ticket.iIdReservacion, Empleado.vNombreCompleto
FROM Ticket
LEFT JOIN Empleado
ON Ticket.iIdReservacion = Empleado.iIdEmp
ORDER BY Empleado.vNombreCompleto ASC;

SELECT Platillo.mPrecio, Ingrediente.vNomIngred
FROM Platillo
LEFT JOIN Ingrediente
ON Platillo.iIdIngred = Ingrediente.iIdIngred
ORDER BY Platillo.mPrecio ASC;



