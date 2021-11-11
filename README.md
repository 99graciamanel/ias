# ias
To use our project you just need to run the docker compose in two different machines and configure the nework.

## Configuring the network

Make sure both machines see each other and modify /etc/hosts file in each machine. 
For the one running keycloak:

'Ip of django machine'    django
127.0.1.1       keycloak

For the one running django:

'Ip of keycloak machine'    keycloak
127.0.1.1       django


## Project structure

The project is divided into 3 folders:
* **certs**: contains the Certificate Authority (CA) and webserver (keycloak and nginx) certificates.
* **django**: contains all the configuration related to django as well as the nginx for django.
* **keycloak**: contains all the configuration related to keycloak as well as the nginx for keycloak.

## Running the dockers

In order to execute the django docker:
```
cd django
sudo docker-compose up
```

In order to execute the keycloak docker:
```
cd keycloak
sudo docker-compose up --build
```
