# SPRINTS SEMANALES

## Sprint inicial

### Proceso:

  * Creado repo TFG
  * GIT API Token: 5b65e73261ea9e1c3bde4bb71acb16261261fbac
  * Creado "credentials.cfg" en /home/jonycp --> pwd

  * Docker instalado:
    * https://docs.docker.com/install/linux/docker-ce/ubuntu/
    * Elegir distro de linux y bajar: https://download.docker.com/linux/
    * sudo dpkg -i /path/to/package.deb
    * grimoire lab /full  
    (includes GrimoireLab and runs SirMordred, as grimoirelab/installed does, but also includes all services needed to produce a dashboard)
    (includes Elastic Search, MariaDB and Kibiter) https://hub.docker.com/r/grimoirelab/full

    * sudo  docker run -p 127.0.0.1:5601:5601 -v $(pwd)/credentials.cfg:/override.cfg -t grimoirelab/full
    * sudo  docker run -p 127.0.0.1:5601:5601 -p 127.0.0.1:9200:9200 -p 127.0.0.1:3306:3306 -v $(pwd)/credentials.cfg:/override.cfg -t grimoirelab/full
    * docker run info --> https://docs.docker.com/engine/reference/run/

---


## Sprint 11.4
  * Conseguir enlazar docker de Grafana con docker de Grimoire Lab.
  * Instalar grafana en local. Intentar de nuevo enlazar con docker de GL (más útil para un futuro).
  * Seguir tutorial de Grafana para observar diferentes representaciones visuales dados los datos de ElasticSearch.
  * Intentar extraer visualizaciones concretas de Kibana y utilizarlas en Grafana.

### Proceso
  * Instalado Grafana en local:
    (https://grafana.com/grafana/download?platform=linux)  
    `wget (https://dl.grafana.com/oss/release/grafana_6.1.3_amd64.deb)`  
    `sudo dpkg -i grafana_6.1.3_amd64.deb`

  * Utilizando Grafana:  
    <https://grafana.com/docs/installation/debian/>  
    [https://grafana.com/docs/guides/getting_started/]  
    [https://grafana.com/docs/guides/basic_concepts/]   
    Lanzar: `sudo service grafana-server start`. (127.0.0.1:3000)
    This will start the grafana-server process as the grafana user, which was created during the package installation. The default HTTP port is 3000 and default user and group is admin. Default login and password admin/ admin.  

  * Enlazando Grafana con docker:
    https://grafana.com/docs/features/datasources/elasticsearch/  
    Captura de configuración ElasticSearch

  * Dashboards dada BD:  
    [Tutorial básico dashboards](https://www.youtube.com/watch?v=sKNZMtoSHN4&index=7&list=PLDGkOdUX1Ujo3wHw9-z5Vo12YLqXRjzg2)  
    Capturas de generacion de graficos dado index *git*, time field name `metadata__timestamp` (fecha recolección datos).  
    También se puede poner time field `grimoire_creation_date` (fecha original de creación del dato).  


---


## Sprint 21.5
  * Extraer visualizaciones concretas de Kibana y utilizarlas en Grafana. Para ello se utilizarán los índices enriquecidos de git, github y pipermail.
  * Explorar el apartado de plugins que ofrece Grafana para así explotar al máximo el software.
  * En un futuro, posible despliegue de la aplicación en la web.

### Proceso
  * Se han utilizado los índices `git`, `mail_grimoirelab`, `git_areas_of_code` `github`. Se han representado dashboards de los tres índices.
  * Plugins instalados y usados:
    * [**Pie Chart**](https://grafana.com/plugins/grafana-piechart-panel): piechart como Kibana (OK)
    * [**Worldmap Panel**](https://grafana.com/plugins/grafana-worldmap-panel) : no tenemos en BD coordenadas para el worldmap
    * [**Worldping**](https://grafana.com/plugins/raintank-worldping-app): (futuro despliegue web)
    * [**Annunciator**](https://grafana.com/plugins/michaeldmoore-annunciator-panel): mejora de singlestat. usado en github issues (OK)
    * [**Blendstat**](https://grafana.com/plugins/farski-blendstat-panel): mejora de singlestat (multiples series o queries) (OK)
    * [**Carpet plot**](https://grafana.com/plugins/petrslavotinek-carpetplot-panel): espectro, para horas de mayor concurrencia de commits (OK)
    * [**Bubble Chart**](https://grafana.com/plugins/digrich-bubblechart-panel): tipo de lenguaje usado (OK)
    * [**Datatable Panel**](https://grafana.com/plugins/briangann-datatable-panel): mejora de table (search, filter,...) (alias no work, in development)(OK)
    * [**Diagram**](https://grafana.com/plugins/jdbranham-diagram-panel): diagramas de flujo (mermaid syntax, extrapolar) : https://mermaidjs.github.io/ (OK)
    * [**Epict Panel**](https://grafana.com/plugins/larona-epict-panel): Bitergia image (no funciona metric)(OK)
    * [**Geoloop**](https://grafana.com/plugins/citilogics-geoloop-panel): igual que worldmap (OK)
    * [**PictureIt**](https://grafana.com/plugins/bessler-pictureit-panel): imagenes de fondo + metrics (no funciona metric)(OK)
    * [**Progress List**](https://grafana.com/plugins/corpglory-progresslist-panel): como multistat (mejor este) (OK)
    * [**BreadCrumb**](https://grafana.com/plugins/digiapulssi-breadcrumb-panel): breadcrumb de dashboards (un poco useless) (OK)
    * [**Boom Theme**](https://grafana.com/plugins/yesoreyeram-boomtheme-panel): temas de fondo (OK)
    * [**Multistat**](https://grafana.com/plugins/michaeldmoore-multistat-panel): barras vert/horiz + thresholds, multi metric (OK)
        Note the data set format is set to 'Table' (Multistat does not support time series data sets)  
        The Group Name Filter field (this is an advanced feature most users can ignore. If in doubt, make sure this is blank. Especially if the chart appears to be empty!). This field should be a regular expression string which is used to filter out non-matching group names, when needed.
    * [**Radar Graph**](https://grafana.com/plugins/snuids-radar-panel): codigo, commits,... (OK)
    * [**Ploty**](https://grafana.com/plugins/natel-plotly-panel): 3d scatter plot of what?
    * [**Polistat Panel**](https://grafana.com/plugins/grafana-polystat-panel): como multistat pero de celdas (OK)
    * [**Statusmap**](https://grafana.com/plugins/flant-statusmap-panel): caso maquina expendedora (hay, no hay, ok, hueco...)(horas de no actividad p.e.)
    * [**Clock**](https://grafana.com/plugins/grafana-clock-panel): reloj (OK)


---


## Sprint 30-5
  * Explorar el resto de plugins de grafana (MENCIONAR AQUI LOS PLUGINS AVANZADOS, EN EL OTRO SPRINT LOS BASICOS) (COMPARACION EN SECCION 5, PASAR RAPIDO DE ESTE SPRINT)
  * Comparar los resultados obtenidos con los dashboards de Kibana.
  * Explicar las limitaciones o mejoras de Grafana con respecto a Kibana.

### Proceso
  * Todos los plugins probados (ver arriba OKs).
  * COMPARACIÓN: Se pueden obtener diagramas casi idénticos. Hay algunos aspectos diferentes: apartado **problemas**.
  * PROS:
    * Aspecto visual más bonito. Herramientas como Singlestat o Blendstat (plugin) permiten obtener un dato básico con su respectiva gráfica evolutiva de fondo. Posibilidad de agrupar diferentes paneles por rows (add row), y clasificarlos según lo que muestren.
    * Infinidad de plugins. Se han usado plugins para representar datos de distintas formas, utilidades... (ver arriba). Aunque ofrece también plugins para poder utilizar muchas otras BBDD, aparte de las que vienen de serie (MariaDB, InfluxDB, ElasticSearch...).
    * Bastantes apps. Se instalan junto a Grafana (Zabbix, Worldping, Worldmap...).
    * Interfaz más sencilla e intuitiva. Se permite manipular (editar, copiar, etc.) de manera más rápida y simple que en Kibana.
    * Permite exportar dashboards muy facilmente (son ficheros JSON) o hacer snapshots de ellos.
    * Permite crear playlists de varios dashboards You can use playlists to cycle dashboards on TVs without user control. (https://grafana.com/docs/reference/playlist/)
    * Sencillo sistema de alertas para dashboards en tiempo real. https://grafana.com/docs/alerting/rules/ https://grafana.com/docs/alerting/notifications/

  * CONTRAS:
    * Kibana posee el plugin `console`, proporcionando una interfaz que permite interactuar directamente con la API REST de Elasticsearch. Grafana no lo tiene.
    * No se puede poner label en el eje x.
    * No tenemos barras fijas superiores con desplegables como en Kibana (p.e. Git -> Overwiew ; Github --> Issues).
    * Un poco tosco con las unidades. Es necesario cambiar hasta dos veces (en las zonas de metric y display) el tipo de unidad, depende de la visualización.
    * Un poco tosco con el dato a representar. Ejemplo: queremos avg o difference, tenemos que elegirlo en hasta dos sitios diferentes (como arriba).
    *


---


## Sprint 19-6
  * Construir un docker que permita desplegar todo de una vez (que incluya grafana basicamente)
  * Explorar los filtros generales o filtros de tiempo de Grafana: +- en tablas, arrastrar eje de tiempos en graficas, ver como cambian el resto de graficas...
  * Github issues --> Reproducir uno o varios de los de kibana y explorar el index. Ver cuando se ha abierto y cerrado un ticket, mediana de tickets cerrados,
    tickets antigüos vs nuevos, ver si se han cerrado pocos viejos pero muchos nuevos, etc.

### Proceso
  * Construyendo docker con grafana:
    * Se clona el proyecto grimoirelab (https://github.com/chaoss/grimoirelab).
    * He utilizado como base "dockerfile-full". Se ha creado dockerfile-grafana. Comandos nuevos al principio y al final. Se ha tenido que cambiar USER root al cambiar los permisos de ejecucion de entrypoint.sh.
    * Añadidas las dependencias de grafana (https://grafana.com/grafana/download).
    * Manual de utilización de docker build (https://docs.docker.com/engine/reference/commandline/build/).
    * Manual de utilización dockerfile (https://odewahn.github.io/docker-jumpstart/building-images-with-dockerfiles.html).
    * Manual 2 (https://www.howtoforge.com/tutorial/how-to-create-docker-images-with-dockerfile/).
    * Se crea nuevo entrypoint. Me baso en `entrypoint-full.sh`. Se cambia la parte de Grafana.
    * Comando de creacion de imagen: `docker build -f $(pwd)/docker/Dockerfile-grafana -t grimoirelab/grafana:latest .`. -- Usar en path adecuado (dentro de home/user/grimoirelab/).
    * Comando ejecución contenedor: `docker run -p 127.0.0.1:5601:5601 -p 127.0.0.1:9200:9200 -p 127.0.0.1:3306:3306 -p 127.0.0.1:3000:3000 -v $(pwd)/credentials.cfg:/override.cfg -t grimoirelab/grafana` -- en home
    * User/pass de grafana en contenedor: admin/admin.
  * Explorados filtros de grafana.
  * Github issues explorado.

### PROBLEMAS
  * El puerto 3000 de grafana no se cierra tras cada run del container. hace falta matar el proceso de grafana para liberar el puerto, si no el segundo container no se conecta :3000 --> `sudo kill PID`.


---


## Sprint 10/10
  * Exportar datasources/dashboards de Grafana local.
  * Importar en contenedor datasources/dashboards.
  * Llevar al día la memoria.

### Proceso
  * EXPORTACIÓN / IMPORTACIÓN (dos métodos):
    * Exportando `grafana.db` directamente. Se encuentra en "/var/lib/grafana/". Tosco pero efectivo. Exporta toda la confi de usuario. Utilizar ADD en dockerfile.
    * Exportando datasources y dashboards por separado:
      * Para exportar datasources de Grafana en local:
        * Nos basamos en: https://rmoff.net/2017/08/08/simple-export/import-of-data-sources-in-grafana/
        * Modificamos con: `mkdir -p $(pwd)/data-sources && curl -s "http://localhost:3000/api/datasources"  -u admin:12341829as|jq -c -M '.[]'|split -l 1 - $(pwd)/data-sources/`
      * Para exportar dashboards de Grafana en local:
        * Lo mas facil es exportar a mano uno a uno en archivos JSON --> https://grafana.com/docs/reference/export_import/
        * Los guardo en `/grimoirelab/docker/dashboards`
      * Añadiendo datasources a la docker image:
        * Modificamos `dockerfile-grafana`, para añadir este nuevo fichero y poder usarlo despues, con ADD. Movemos previamente data_sources a grimoirelab/docker).
        * Modificamos `entrypoint-full.sh` para poder importar los indices de `data-sources` a Grafana.
      * Añadiendo dashboards a la docker image:
        * Lo mas facil es mediante el aprovisionamiento que proporciona la API de Grafana: https://grafana.com/docs/administration/provisioning/#dashboards
        * Creamos un fichero del estilo al tutorial y lo guardamos en `grimoirelab/docker/dashboard-config.yaml` y despues añadimos con ADD el fichero en dockerfile a la imagen.

### Añadidos
  * Mencionar shortcuts en "uso grafana": https://grafana.com/docs/reference/keyboard_shortcuts/

### PROBLEMAS GENERALES
  * No se puede poner label en el eje x.
  * RESUELTO -- Pie Chart can only handle time series data, if you look at the handler
  * RESUELTO -- No podemos poner intervalos de semanas, meses, años en los grafos. Máximo intervalos de refresco de 1d. --> (min time interval en "queries")
  * RESUELTO -- En grafos, se puede poner como eje x algo distinto a un eje de tiempos, poniendo "serie" en opciones de X axis, y group by grupo. --> RESUELTO
  * RESUELTO -- No se puede un "unique count of string field" (count of hash commits p.e.), siempre nos pide group by. En Kibana es un simple unique count.
  * RESUELTO -- POR QUE EN GIT OVERWIEW, EN AUTHORS, VARIA TANTO SI PONEMOS git (metadata__timestamp) vs git commit (grimoire_creation_date).


## Extra
  * Analizar un proyecto especifico (repos de ES, Grafana oficiales) y utilizar exactamente el mismo contenedor pero cambiando projects.json (ver documentacion en grimoirelab/docker/read.me || docker/projects.json).
  * https://github.com/chaoss/grimoirelab/blob/master/docker/projects.json
  * https://github.com/grafana
  * Posibilidad de desplegar varios contenedores con proyectos diferentes. Para ello, guardar en local lo que recogemos al desplegar (ver read.me, apartado grimoirelab/full --> -v $(pwd)/es-data:/var/lib/elasticsearch).

  By default, Elasticsearch will store indexes within the container image, which means they are not persistent if the image shuts down. But you can mount a local directory for Elasticsearch to write the indexes in it. this way they will be available from one run of the image to the next one. For example, to let Elasticsearch use directory es-data to write the indexes:
    $ docker run -p 127.0.0.1:9200:9200 -p 127.0.0.1:5601:5601 \
    -v $(pwd)/mytoken.cfg:/override.cfg \
    -v $(pwd)/logs:/logs \
    -v $(pwd)/es-data:/var/lib/elasticsearch \
    -t grimoirelab/full

  * Proyecto CAULDRON. Posibilidad de integracion de Grafana con una aplicación en la web.

  * DB guardada localmente:
   docker run -p 127.0.0.1:5601:5601 -p 127.0.0.1:9200:9200 -p 127.0.0.1:3306:3306 -p 127.0.0.1:3000:3000 -v $(pwd)/credentials.cfg:/override.cfg -v $(pwd)/es-data:/var/lib/elasticsearch -t grimoirelab/grafana
---




## CAMBIOS MEMORIA / CONTENIDO ----------------------------------------------------------------------
  * Subiendo imagen a dockerhub: https://ropenscilabs.github.io/r-docker-tutorial/04-Dockerhub.html
    * Link a proyecto : https://hub.docker.com/repository/docker/onac8/grafana-grimoirelab
