Para crear y probar la base de datos con __todos sus componentes__ es necesario ejecutar los Scripts en el siguiente orden:
  1. Ejecutar el archivo `.\scripts\Tables\createTable.sql` para crear la base de datos con todas las tablas.
  2. Ejecutar el archivo `.\scripts\Populate\populate.sql` para crear datos de *prueba*.
  3. Ejecutar el archivo `.scripts\Procedures\procedures.sql` para crear los procedimientos y funciones.
  4. Ejecutar el archivo `.scripts\Triggers\triggers.sql` para crear los disparadores sobre las tablas, usan alguna función creada antes.

Tras esto, será posible ejecutar el archivo `.\scripts\Tables\testing.sql` descomentando las lineas pertinentes para comprobar las restricciones.
