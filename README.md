# Introduction

This [docker](https://hub.docker.com/r/onac8/grafana-grimoirelab) is dedicated to the representation of data through dashboards, thanks to a free software tool called [Grafana](https://grafana.com/). The obtained information allows us to analyze one or more specific projects in depth, focusing on different aspects, such as the study of statistics (mean, maximum / minimum, deviations ...), use of tables, listings or tops, or maybe a more visual or attractive representation, through the use of bar graphs, scattering, etc.

All data is extracted from multiple repositories of Git and GitHub, and from different mailing lists, thanks to the [GrimoireLab](https://chaoss.github.io/grimoirelab-tutorial/) opensource tool, precisely created for this purpose. The data is stored in Elasticsearch indexes, a tool that will allow us to access the different indexes created during the collection in Grafana.

The different dashboards created, the installation and configuration of the different applications used, are finally integrated into this docker image.

## How to use

The first step, the deployment. In this example, the demonstration will be focus on the CHAOSS project. We need to execute this lines:

`docker run -p 127.0.0.1:5601:5601 -p 127.0.0.1:9200:9200\`  
`-p 127.0.0.1:3306:3306 -p 127.0.0.1:3000:3000 \`  
`-v $(pwd)/credentials.cfg:/override.cfg \`  
`-t grimoirelab/grafana`  

Each argument used in the statement has a purpose: in the first two ordered lines we indicates the IP and the port (-p flag) of the four main tools (GrimoireLab / Kibana, API of Elasticsearch, MariaDB and Grafana). In addition, each port is indicated twice (local machine vs inside the container), usually the same. The -v flag tell us which volume will be mounted in the container, in this case the GitHub Key API allocated in the file `credentials.cfg`. Finally, the -t flag indicates the tag of the image to be executed.

Before executing the container, we need to create that `.cfg` file, which looks like this:  

`[github]`  
`api-token = XXX`  

[Here](https://help.github.com/es/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line), we can learn how to get our GitHub API Token.

Now, we can deploy our container. Then go to a browser, and type `127.0.0.1:3000` to access to Grafana client. The `user/password` are `admin/12341829as` in this example. Then, we will see a Home where we can visualize different dashboards of the project, grouped by categories.


## Analyze other projects

The default project study in this docker is the CHAOSS Project (analyzing the repositories and mailing lists of the project itself), so it is not necessary to map the file called `projects.json`, a document used to decide which project to study. To analyze other projects, we must change this `.json` file (allocated in *grimoirelab/docker/*). This file gives GrimoireLab the urls of the different repositories and mailing lists of a project (see GrimoireLab [repo](https://github.com/chaoss/grimoirelab) for more information).



## Docker image with local preinstalled Grafana

We can use this docker even if we have already Grafana installed in our system. We can use different port when deploying the container, to avoid connection issues. Also, all changes we make in our Grafana will not be deleted when the container end its execution.

## Demo and tutorials
Youtube Playlist: https://www.youtube.com/playlist?list=PLCVLuotTGE7hU7RdRduHZcCPVar1wbXdD
