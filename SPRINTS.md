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
  * Explorar el resto de plugins de grafana
  * Comparar los resultados obtenidos con los dashboards de Kibana.
  * Explicar las limitaciones o mejoras de Grafana con respecto a Kibana.

### Proceso
  * Todos los plugins probados (ver arriba OKs).
  * COMPARACIÓN: Se pueden obtener diagramas casi idénticos. Hay algunos aspectos diferentes: apartado **problemas**.
  * PROS:
    * Aspecto visual más bonito. Herramientas como Singlestat o Blendstat (plugin) permiten obtener un dato básico con su respectiva gráfica evolutiva
      de fondo. Posibilidad de agrupar diferentes paneles por rows (add row), y clasificarlos según lo que muestren.
    * Infinidad de plugins. Se han usado plugins para representar datos de distintas formas, utilidades... (ver arriba). Aunque ofrece también plugins para
      poder utilizar muchas otras BBDD, aparte de las que vienen de serie (MariaDB, InfluxDB, ElasticSearch...).
    * Bastantes apps. Se instalan junto a Grafana (Zabbix, Worldping...).
    * Interfaz más sencilla e intuitiva. Se permite manipular (editar, copiar, etc.) de manera más rápida y simple que en Kibana.
    * ?

  * CONTRAS:
    * Kibana posee el plugin `console`, que proporciona una interfaz que permite interactuar directamente con la API REST de Elasticsearch. Grafana no lo tiene.
    * No se puede poner label en el eje x.
    * No podemos poner intervalos de semanas, meses, años en los grafos. Máximo intervalos de refresco de 1d.
    * No tenemos barras fijas con desplegables como en Kibana (p.e. Git -> Overwiew ; Github --> Issues).
    * Un poco tosco con las unidades. Es necesario cambiar hasta dos veces (en las zonas de metric y display) el tipo de unidad, depende de la visualización.
    * Un poco tosco con el dato a representar. Ejemplo: queremos avg o difference, tenemos que elegirlo en hasta dos sitios diferentes (como arriba).
    ?


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
    * Comando de creacion de imagen: `sudo docker build -f Dockerfile-grafana -t grimoirelab/grafana:latest .`. Usar en path adecuado (dentro de grimoirelab/docker).
    * Comando ejecución contenedor: `sudo  docker run -p 127.0.0.1:5601:5601 -p 127.0.0.1:9200:9200 -p 127.0.0.1:3306:3306 -v $(pwd)/credentials.cfg:/override.cfg -t grimoirelab/grafana` --> igual pero con grimoirelab/grafana.
  * Explorados filtros de grafana.
  * Github issues explorado.



---

## PROBLEMAS GENERALES
  * No se puede poner label en el eje x.
  * RESUELTO -- Pie Chart can only handle time series data, if you look at the handler
  * RESUELTO -- No podemos poner intervalos de semanas, meses, años en los grafos. Máximo intervalos de refresco de 1d. --> (min time interval en "queries")
  * RESUELTO -- En grafos, se puede poner como eje x algo distinto a un eje de tiempos, poniendo "serie" en opciones de X axis, y group by grupo. --> RESUELTO
  * RESUELTO -- No se puede un "unique count of string field" (count of hash commits p.e.), siempre nos pide group by. En Kibana es un simple unique count.
  * POR QUE EN GIT OVERWIEW, EN AUTHORS, VARIA TANTO SI PONEMOS git (metadata__timestamp) vs git commit (grimoire_creation_date).


## FIN ---------

### Estructura del TFG (desarrollo):
  1. Evaluacion de grafana: plugins relevantes o no, capturas + que se pueda mostrar comentario relevante de ellos

  2. Demo ???:
    * 1,2,... dashboards con los paneles nativos de grafana donde se muestren datos coherentes de la BD (no repetir graficos, tablas,...)
    * evaluacion especifica --> mismos datos que en kibana, ver si en grafana se pueden hacer igual o no y comentarlo.
    * 1,2,  dashboards con los distintos plugins utilizados (tengan o no sentido)

  3. Resolver problema concreto
    * dashboards especificos para cada publico (visual, datos, ...)
    * dashboards de persona de proyecto especifica. [Ejemplos de lucene query con ES](https://grafana.com/plugins/snuids-radar-panel)
    * dashboard de como sale o entra gente del proyecto (misma grafica donde se vea gente que entra/sale)

  4. Poner todo en la nube

  5. Utilizar bd mysql (incluido en el contenedor). dashboards separados de ES y MYSQL, o dashboards combinados de ES y MYsql



## MEMORIA
  * OK -- Hojear memorias de gsyc, mirar latex, coger template de gregorio. normativa de la memoria (pagina urjc y escuela de teleco)
  estructura.
  * OK -- Introducion (inicio, voy a hacer esto o aquello y por que de este proyecto y grafana vs kibana, datos usados (libres) .... objetivos concretos)
  * OK -- Estado del arte (tecnologias similares), presentacion de la tecnologia utilizada kibana es,...) tableau, manyeyes... -- 15-20pags max min 10
  * Como se ha hecho el proyecto, estructuracion -- scrum, sprints -- ciclos diferentes (diagrama de tiempo estimado en ciclos) -- +-10pags
  * resultados:
    * 1,2,3,4,5 --> hablar en profundidad de cada apartado +-20pags
  * conclusiones (he visto que se pueden hacer los objetivos o no, evaluacion de grafana, problemas, cosas relacionadas (cloud, gitpage,...) --> hacerse VALER AQUI) --
  * bibliografia
  * referencias
  * 60 paginas memoria?

  * jekill, pagina en github para proyecto (web)
