USE assaabloy;
-- Seleccionar todas las puertas de nuestro sistema
SELECT NOMBREEMPRESA, CIF, IBAN, DIRECCION, MAIL, FAX, NUMEROSERIE AS 'NUMERO DE SERIE DE LA PUERTA',
					FECHAADQUISICION, CONCAT('#',COLOR) AS 'COLOR', DIMENSIONA AS 'DIMENSION ÁREA',
					ESMOTORIZADA FROM clientes, puertas
	WHERE clientes.IDCLIENTE = puertas.IDCLIENTE;

-- Telefonos de las empresas, contactos
(SELECT NOMBREEMPRESA AS 'EMPRESA', telefonos.NUMTELF AS 'TELEFONO' FROM clientes, telefonos
	WHERE clientes.IDCLIENTE = telefonos.IDCLIENTE AND NOT ISNULL(telefonos.IDCLIENTE))
UNION
(SELECT proveedores.NOMBRE AS 'EMPRESA', telefonos.NUMTELF 'TELEFONO' FROM proveedores, telefonos
	WHERE PROVEEDORES.IDPROVEEDOR = telefonos.IDPROVEEDOR AND NOT ISNULL(telefonos.IDPROVEEDOR));
-- Materiales de que proveedores se encuentran en qué almacén, por orden alfabético
SELECT proveedores.NOMBRE AS 'EMPRESA', materiales.TIPO, materiales.STOCK, materiales.PRECIOUNITARIO, materialesalmacenes.IDALMACEN
 FROM materialesalmacenes, proveedores, materiales
 	WHERE proveedores.IDPROVEEDOR=materiales.IDPROVEEDOR AND materiales.IDMATERIAL=materialesalmacenes.IDMATERIAL
 	ORDER BY TIPO ASC;
-- Que empleado trabaja en el mantenimiento de qué puerta
SELECT CONCAT(CONCAT(empleados.APELLIDOS,", "), empleados.NOMBRE) AS 'EMPLEADO',puertas.NUMEROSERIE 'PUERTA EN LA QUE TRABAJA' FROM empleados,
					mantenimientosempleados, puertasempleados, puertas
		WHERE mantenimientosempleados.IDEMPLEADO = empleados.IDEMPLEADO
				AND puertasempleados.IDEMPLEADO = empleados.IDEMPLEADO
				AND puertas.IDPUERTA = puertasempleados.IDPUERTA;
-- Espacio total que ocuparía cada material
SELECT MATERIALES.IDMATERIAL, SUM(materiales.TAMANIO * materiales.STOCK) AS 'ESPACIO QUE OCUPA' FROM materiales
	GROUP BY IDMATERIAL;
-- Qué materiales forman que puerta
SELECT materiales.TIPO, puertas.NUMEROSERIE FROM materiales, puertas, materialespuertas
	WHERE materiales.IDMATERIAL = materialespuertas.IDMATERIAL AND puertas.IDPUERTA = materialespuertas.IDPUERTA
	ORDER BY TIPO;
-- Qué puertas tienen aún garantía y su plazo de mantenimiento se ha acabado
SELECT puertas.NUMEROSERIE FROM puertas
	WHERE puertas.IDPUERTA IN (SELECT garantias.IDPUERTA FROM GARANTIAS
											WHERE garantias.MOTIVOANUL IS NULL)
			AND puertas.IDPUERTA IN (SELECT puertasempleados.IDPUERTA FROM puertasempleados
												WHERE puertasempleados.IDEMPLEADO IN (SELECT empleados.IDEMPLEADO FROM EMPLEADOS
																										WHERE empleados.IDEMPLEADO IN (SELECT mantenimientosempleados.IDEMPLEADO FROM mantenimientosempleados
																																					WHERE mantenimientosempleados.IDMANTENIMIENTO IN (SELECT mantenimientos.IDMANTENIMIENTO FROM MANTENIMIENTOS
																																																									WHERE mantenimientos.FECHAFIN IS NOT NULL AND DATEDIFF(NOW(),mantenimientos.FECHAFIN) >= 0)
																																				)
																									)
											);