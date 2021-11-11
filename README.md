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

## Running the dockers

