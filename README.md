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
- Build docker image
```bash
docker compose build
```  
- Run the Container
```bash
docker compose up -d
```
> [!IMPORTANT]  
> Keep in mind not to commit your .env file.

- Visit the Website and Login

Open a Webbroser and enter the target destination
```bash
<HostIp>:8282
 ```

## Usage

