USE assaabloy;
-- TESTS PRODECIMIENTOS
-- CALL pModificarEstadoGarantia(NOW(), 5);
-- CALL pInsertarEmpleado("FERNANDO JOSE", "MATEOS GOMEZ", "TECNICO", 34618587795);
-- CALL MODIFICARHISTORIAL(20, "Pipeta Nueva", DATE_ADD(NOW(), INTERVAL 1 DAY), 20);
-- CALL MODIFICARHISTORIAL(21, "Nuevo pomo", NULL, 32.5);
-- CALL INSERTARPUERTA("TrL0Wa8qMw", "MEGADOOR", NOW(), "FFFFFF", 20.5, 1, "52581704D");
-- CALL INSERTARCLIENTE("52511704X", "NO7348841255552956727110257X2", "Los Pacos", "Poligono Hytasa", NULL, NULL,"TrL0Wa8qMx", "MEGADOOR", NOW(), "FFFFFF", 20.5, 1);
-- CALL PMODPUERTA(51, '008000', NULL);
-- CALL PMODPUERTA(51, NULL, NULL);
-- CALL PMODPUERTA(NULL, '008000', NULL);
-- CALL PMODMATERIALES(20, NULL, NULL);
-- CALL PMODMATERIALES(21, 15.75, NULL);
-- CALL PMODMATERIALES(22, NULL, 30);
-- CALL PMODMATERIALES(21, NULL, NULL);
-- CALL PMODPROVEEDORES(25, NULL, NULL, 25230067213, "EL PEQUEÑO DEMONIO");
-- CALL pModificarEmpleado(69, 34954573732);
-- CALL pModificarCliente(25894325789, NULL, NULL, NULL, 30);
--  UPDATE mantenimientos 
-- 	SET mantenimientos.FECHAINI = "2021-11-15"
-- 	WHERE mantenimientos.IDMANTENIMIENTO = 1;
--  
-- -- RF14 (no se puede modificar el empleo de un empleado)
-- UPDATE empleados
-- 	SET empleados.empleado = "PEON",
-- 	NOMBRE = "Manolo",
-- 	APELLIDOS = "Pérez"
-- 	WHERE empleados.idempleado = 1;
-- 
-- RF14 (no se puede modificar el nombre de un empleado)
-- UPDATE empleados
-- 	SET empleados.empleado = "PEON",
-- 	NOMBRE = "Manolo",
-- 	APELLIDOS = "Pérez"
-- 	WHERE empleados.idempleado = 1;
-- --
-- RF14 (no se pueden modificar los apellidos de un empleado)
-- UPDATE empleados
-- 	SET empleados.empleado = "PEON",
-- 	NOMBRE = "Manolo",
-- 	APELLIDOS = "Pérez"
-- 	WHERE empleados.idempleado = 1;
-- 
-- -- -- CHECK ENUM_EMPLEADO
-- UPDATE empleados
--    SET empleados.empleado = "PAYASO",
--    NOMBRE = "Manolo",
--    APELLIDOS = "Pérez"
--    WHERE empleados.idempleado = 1;
-- -- 
-- --  CHECK CK_TELEFONO (menos de 12 dígitos)
-- UPDATE empleados
--    SET empleados.empleado = "PEON",
--    NOMBRE = "Manolo",
--    APELLIDOS = "Pérez",
-- 	  TELEFONO = 67822551
-- 	WHERE empleados.idempleado = 1;
-- 
-- -- -- CHECK CK_TELEFONO (más de 12 dígitos)
-- UPDATE empleados
--    SET empleados.empleado = "PEON",
--    NOMBRE = "Manolo",
--    APELLIDOS = "Pérez",
-- 	TELEFONO = 6782255164
-- 	WHERE empleados.idempleado = 1;
-- 	
-- -- RF9 (no se puede modificar la dirección de un proveedor)
-- UPDATE proveedores
-- 	SET proveedores.direccion = "C/Manzanilla"
-- 	WHERE proveedores.idproveedor = 2;
--
-- -- RF9 (no se puede modificar la dirección de un proveedor)
-- UPDATE proveedores
-- SET proveedores.nombre = "Mama Golli"
-- WHERE proveedores.idproveedor = 2;
-- 	
-- -- RF8 (no se puede modificar el CIF de la empresa de un cliente)
-- UPDATE clientes
-- 	SET CIF = "44518615P",
-- 	NOMBREEMPRESA = "Los pepones",
-- 	DIRECCION = "Reina Mercedes 9"
-- 	WHERE IDCLIENTE = 5;
--
-- -- RF8 (no se puede modificar el nombre de la empresa de un cliente)
-- UPDATE clientes
-- 	SET NOMBREEMPRESA = "Los pepones"
-- 	WHERE IDCLIENTE = 5;
-- 
-- -- RF8 (no se puede modificar la dirección de la empresa de un cliente)
-- UPDATE clientes
-- 	SET	DIRECCION = "Reina Mercedes 9"
-- 	WHERE IDCLIENTE = 5;
--
-- -- RN1 (alerta cuando el stock de un material sea menor a 10 -> no se puede modificar)
 --  UPDATE materiales 
 --    SET STOCK = 2;
 
-- 
-- -- RF11 (no se puede modificar el tamaño de un material)
-- UPDATE materiales
--    SET tamanio = 70.5
--		WHERE IDMATERIAL=1;
-- 
-- -- RF11 (no se puede modificar el tipo de un material)
-- UPDATE materiales
--    SET tipo = "MIRILLA"
--		WHERE IDMATERIAL=1;
-- 
-- INSERT INTO materialesalmacenes VALUES (101,2,1);
-- INSERT INTO materiales VALUES (101, 1, "a", 1, 101, 101);
-- 
 -- RN2 (alerta cuando el stock vaya a superar la capacidad máxima -> no se puede modificar)
-- UPDATE materiales
--  	SET STOCK = 110
--  	WHERE IDMATERIAL = 5;
--	UPDATE almacenes 
--		SET espaciototal = 435
--		WHERE IDALMACEN=5;

-- 
-- -- RN4 (la fecha de anulación se modifica si hay incidencia en el producto -> motivo de anulación) 
-- UPDATE GARANTIAS
-- 	SET garantias.MOTIVOANUL = "Ha rallado la puerta"
-- 	WHERE IDGARANTIA = 1;
-- 
-- -- RN5 (solo se cobra al cliente si la garantía se ha anulado o si se ha acabado el plazo)
-- UPDATE facturas
-- 	SET COBRO = 101
-- 	WHERE facturas.IDFACTURA = 1;
--
-- -- RF13 (solo se puede modificar de las puertas el color)
-- UPDATE puertas
-- 	SET PUERTA = "MEGADOOR",
-- 		IDCLIENTE = 20,
-- 		FECHAADQUISICION = NOW(),
-- 		DIMENSIONA = 10.5,
-- 		ESMOTORIZADA = 1;
		
-- -- RF13 (solo se puede modificar de las puertas el color)
-- INSERT INTO PUERTAS VALUES (103,"PbF3W85fR4",1,"MEGADOOR","2021-06-28","f27166",20,0);
-- INSERT INTO PUERTAS(NUMEROSERIE, IDCLIENTE, PUERTA, FECHAADQUISICION, DIMENSIONA) VALUES ('XHB5O83fNg', 100, 'a', NOW(), 0);
-- INSERT INTO PUERTAS(NUMEROSERIE, IDCLIENTE, PUERTA, FECHAADQUISICION, DIMENSIONA) VALUES ('XHB5123fNG', 100, 'a', NOW(), 10);
-- INSERT INTO PUERTAS(NUMEROSERIE, IDCLIENTE, PUERTA, FECHAADQUISICION, COLOR ,DIMENSIONA) VALUES ('XHB5121fNg', 100, 'batiente', NOW(), 'RFC123' ,10);
--
-- -- RF10 (no se puede modificar la fecha inicial de un mantenimiento)
-- INSERT INTO mantenimientos VALUES (101,NULL,NOW(), NULL);
-- UPDATE mantenimientos
-- 	SET mantenimientos.FECHAINI = '2012-11-10'
-- 		WHERE mantenimientos.IDMANTENIMIENTO = 101;
--
-- -- CHECK CK_TELEFONO
-- INSERT INTO telefonos(NUMTELF) VALUES (10000000000 - 1);
-- INSERT INTO telefonos(NUMTELF) VALUES (999999999999 + 1);
--
-- -- RF11 (no se puede modificar el tipo de un material)
-- INSERT INTO materiales(IDPROVEEDOR, TIPO) VALUES (5, 'Pomo Dorado');
-- UPDATE materiales
-- 	SET TIPO = ""
-- 	WHERE IDMATERIAL = 101;
--
-- RF11 (modificar el precio de un material)
-- UPDATE materiales
-- 	SET PRECIOUNITARIO = 0
-- 	WHERE IDMATERIAL = 101;
--
-- -- RF11 (no se puede modificar el tamaño de un material)
-- UPDATE materiales
-- 	SET TAMANIO = 0
-- 	WHERE IDMATERIAL = 101;
--
-- RF11 (modificar el stock de un material)
-- UPDATE materiales
-- 	SET STOCK = 0
-- 	WHERE IDMATERIAL = 101;
--
-- -- CHECK CK_ESPACIOTOTAL
-- INSERT INTO almacenes(ESPACIOTOTAL) VALUES (0);
--
-- -- CHECK CK_PRECIOTOTAL
-- INSERT INTO FACTURAS (IDMANTENIMIENTO, PRECIOTOTAL,COBRO) VALUES (10, -15.6, 20);




