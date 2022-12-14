Name: Michael ONeal
Email: oneal.43@wright.edu
Project 5

# Project Overview

- what is the point of this project and what tools are used
- Part 4 - Diagramming goes here
  - Include a diagram (or diagrams) of your entire workflow. Meaning it should start with a project change / update, the steps that happen in between, and end with the updated version when the server is queried (web page is accessed)

# Run Project Locally

- how you installed docker + dependencies (WSL2, for example)
  * sudo apt update
  * sudo apt install apt-transport-https ca-certificates curl software-properties-common
  * curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  * sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
  * apt-cache policy docker-ce
  * sudo apt install docker-ce
  * sudo systemctl status docker
  * Resource: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

- how to build the container
  * Create a Dockerfile that contains all resources neccessary to build the image and run it as a container. Once the Dockerile has been created, the "docker build" command is used to build the docker image. For this project, I named the image "my-apache2". Once the image was built, I confirmed it was successful by running the "docker images" command.
  * sudo docker build -t my_apache2 .
- how to run the container
  * sudo docker run -dit --name mysite -p 8080:80 my_apache2
- how to view the project running in the container (open a browser...go to ip and port...)
  * Open browser and type http://localhost:8080 
  * Resource: https://hub.docker.com/_/httpd
# DockerHub

- Process to create public repo in DockerHub
  * From your terminal:
  * docker tag my_apache2:latest oneal43/project5:mysite
  #or
  * Login to https://hub.docker.com/
  * Click "Create a Repository"
  * Name the repo "project5"
  * Give a diescription (optional)
  * Ensure "Public" is selected so that the repo appears in Docker Hub search results
  * CLick "Create"
- How to authenticate with DockerHub via CLI using Dockerhub credentials
  * $docker login or $sudo docker login depending on user permissions
  * Enter username
  * Enter password
  - what credentials would you recommend providing?
    * Docker login credentials that were created on https://hub.docker.com/
- How to push container to Dockerhub
  * docker push oneal43/project5:mysite
  * Resources: https://business-science.github.io/shiny-production-with-aws-book/docker-hub.html
# GitHub Actions

- Configuring GitHub Secrets
  - What secrets were set based on what info
    * DOCKER_USERNAME
    * DOCKER_PASSWORD
    * DOCKER_REPO
- Behavior of GitHub workflow
  - what does it do and when
    * The workflow checks the repo it is in, logs into docker, extracts meta data, builds the image using my Dockerfile and pushes it to the repo on DockerHub.
  - what variables in workflow are custom to your project
    * None

# Deployment

- Description of container restart script
-   * The restart script stops the old site, lists running containers, removes the old site container, lists containers, pulls the latest images from Dockerhub, lists images, then runs the image and binds it to port 80
- Setting up a webhook on the server
  - How you installed the [webhook on GitHub](https://github.com/adnanh/webhook)
     * export PATH=$PATH:/usr/local/go/bin
     * wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
     * sudo tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz
     * PATH="$PATH:/usr/local/go/bin"
     * go install github.com/adnanh/webhook
     * go build github.com/adnanh/webhook
  - How to keep the webhook running if the instance is on
     * Create webhook on docker hub that when an image is pushed, it opens port 9000.
- Steps to set up a notifier in GitHub or DockerHub
   * Settings > Webhooks > add webhook
   * Set Payload URL, COntent type, and secret. Selects events you would like to trigger the notification then cliekc add webhook

