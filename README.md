![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Crear una Base de Datos MySQL 

## Introduccion 

Nuestro cliente se encuentra perdido en el tiempo y nos ha propuesto crear una base de datos para su tienda de alquiler de peliculas, en donde tendremos datos como los nombres de peliculas, actores que aparecen en ellas, genero de de las mismas y poco mas sobre la tienda de alquiler. Al ir explorando los datos suministrados por nuestro cliente, nos percataremos que tenemos problema en establecer una estructura 
y a partir de ese incoveniente comenzaremos a darle forma a nuestra base de datos en MySQLWorkbrench

## Pasos 

1)Dentro de MySQLWorkbrench creamos nuestra base de datos que tendra como nombre VHS
-CREATE DATABASE VHS

2) Realizamos una previa limpieza de los datos suministrados en nuestro jupyter notebook
-Actor
-Film
-Rental
-Inventory
-Language
-old_HDD
-category

3) Creamos las relaciones que nos convienen para darle sentindo a la estructura aplicando la funcion '.merge' entre las tablas old_HDD, Actor y Film.

4) Conectamos nustro notebook a MySQLWorkbrench

-str_conn = 'mysql+pymysql://root:#######@localhost:3306/vhs'
-cursor = create_engine(str_conn)

5)Exportamos los datos de cada DataFrame a MySQLWorkbrench
-actor.to_sql(name='actor', con=cursor, if_exists='replace', index=False)
-Estamos exportando la tabla 'actor' a SQL y informandele a SQL que si ya existe la reemplace 
-Repetimos el mismo paso con los DataFrame restantes. 

5)Con nuestros DataFrame ya ingresados en MySQLWorkbrench y dentro de nuestra base de datos aplicamos la funcion 'reverse engineering' para generar un diagrama de Entidad-Relación.

6)Creado ya el diagrama relacionamos las entidades si son one to one, many to one, one to many ò many to many

7)Al momento de terminar las relaciones sincronizamos nuestro modelo y terminariamos de crear nuestra estructura y cargado ya las datos,comenzamos a probar querys para su funcionamiento. 

-Seleccionamos todo de todas las tablas
-Cuales son los actores que aparecen en mas peliculas
-Cuales son las peliculas que mas se rentan en Junio
-Cual es el genero de peliculas que se rentan mas 
-Cual es la pelicula que mas se renta 
-Cual es el actor que mas veces rentan su pelicula

