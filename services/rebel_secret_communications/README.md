# Rebel Secret Communications
API with trusted headers set to only allow requests from docker containers on the same network as the api. This should be the default docker network unless other network configuration interferes.

The aim is to launch a new container and make curl (or equivelent) requests to this container from launched container. This means you have to to use exec in some form.