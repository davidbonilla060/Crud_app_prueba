# Crud_app_prueba
Aplicación con CRUD (Create Read Update Delete) en Flutter. 

## Especificaciones:
La applicación solicita hacer un sistema para registrar usuarios, modificar valores y eliminar registros. Se utilizaron bases de datos en memoria caché a falta de una base de datos en servidor. El framework de desarrollo fue Flutter versión 2.2.3. Escrita en lenguaje Dart.  

## Esquema:
/lib
 	main: Código Principal lanzador de la app
- ui:
	- /screens: Todas las pantallas de la app (login, selección, modificar, registrar, eliminar.)
	- /widgets: tarjeta de presentación del listado.
- db:
	Creación de base de datos en caché tipo sql para almacenamiento de la información de manera local.
- models:
	Plantillas para alimentación de la base de datos

### Jesús Bonilla 1/09/21