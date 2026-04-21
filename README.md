# Conduit-Container

Setup a running fullstack application, this includes the Database, a Django backend as well as an Angular frontend.

# Table of Contents

1. [Prerequisites](#Prerequisites) 
2. [Quickstart](#Quickstart) 
3. [Usage](#Usage)

## PREREQUISITES

- Docker (version 20.10 or higher) installed
- Git installed

## Quickstart


- Clone Repository 
```bash
git clone git@github.com:CloudStar2077/Conduit-Container.git &&
cd Conduit-Container

 ```
Before building the docker image make changes to the following files.
```bash
mv example.env .env  # rename the example.env to .env
cd frontend/src/app/core/interceptors
mv example.api.config.ts api.config.ts # rename the example.api.config.ts to api.config.ts
```
Add your Host IP into the `api.config.ts`. In the `.env`you also need to edit some data, set the django_secret_key and Postgress_Password then add your Host IP to the Allowed_Hosts.

For Example ...
```bash
POSTGRES_PASSWORD=Your_Secure_Password

DJANGO_ALLOWED_HOSTS=localhost,127.0.0.1,backend,YOUR_IP
 ```
> [!IMPORTANT]  
> Keep in mind not to commit your `api.config.ts` and `.env` files

- Build docker image
```bash
cd /Conduit-Container
docker compose build
```  
- Run the Container in Background
```bash
docker compose up -d
```
- Visit the Website and Login

Open a Webbroser and enter the target destination
```bash
<HostIp>:8282
 ```

## Usage

In this Setup multi-stage-builds are used for the Dockerfiles, this ensures that the build environment is not included in the container, this keeps the storage space smaller and makes the deployments faster. There is a `Dockerfile` for the frontend and one for the backend. To prevent the backend from being directly accessible from the internet, which would pose a security risk, an Nginx reverse proxy is used. This acts as an intermediary, receiving incoming requests and forwarding them to the backend service. The settings for this are configured in the `nginx.conf`. For the Database there is a pre-built Docker image from the Docker Hub defined in the `docker-compose.yml`.


