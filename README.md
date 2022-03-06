# CICE infosoccer360

infosoccer360 es un sistema desarrollado para los amantes al deporte de las multitudes,
el Fútbol. Con el sistema podrán visualizar todas estadísticas de las Ligas Santander y la
Liga Premier actualizado diariamente procedente de una API que nos brinda información
fiable referente a las ligas antes mencionadas, ademas cada usuario podrá formar parte
de cada jornada donde podrán hacer comentarios y predicciones de resultados de los
partidos a disputar así como consultar los aciertos y fallos en cada predicción realizada.
Ademas se podrán consultar la tabla de posiciones en tiempo real así como otras
estadísticas relacionadas a los partidos. El sistema contará con una administración donde
se gestionarán los usuarios, los comentarios, se consultarán y actualizarán las
estadísticas de las diferentes ligas.

# Instalación

Para descargar el proyecto puedes clonar el repositorio:

    git clone https://github.com/danneljt2020/infosoccer360.git

#### Instalación de dependencias
En el proyecto se distribuye un fichero (requirements.txt) con todas las dependencias. Para instalarlas
basta con ejectuar:

     pip3 install -r requirements.txt

### Base de Datos
Cargar la base de datos subida a la carpeta del proyecto

**Nota:** Se uso mysql


### Ejecución con el servidor que trae Flask

Una vez que hayas descargado el proyecto, creado las variables de entorno e instalado las dependencias,
puedes arrancar el proyecto ejecutando:

     python3 entrypoint.py
 
#### Usuario adminstrador
 
**user:**      admin@gmail.com

**password:**  admin*123

     
Una vez ejecutado el comando anterior podrás acceder a la aplicación a través de la url:
     
**Página de Inicio -->**  http://localhost:8001/       

    


