# pg-k8s-backup

!STILL UNDER CONSTRUCTION!

Based on idea and code (https://github.com/rinormaloku/postgre-backup-container). My work will be merged once i got some time :) Thanks @rinormaloku (https://github.com/rinormaloku)!

Image can be found here: https://hub.docker.com/r/hiroshui/pg_backup


A lot todos ;-)


# Build (custom) image:
```
#specify args
DOCKER_REGISTRY="<DOCKER_REGISTRY>"
IMAGE_REGISTRY_USERNAME="<DOCKER_USERNAME>"
IMAGE_REGISTRY_PASSWORD="<DOCKER_PASSWORD>"
POSTGRES_IMAGE_NAME="<Name of image>"
POSTGRES_IMAGE_TAG="<Tag of image>"

./build-image.sh
```

# Deploy:

Create namespace:
```
kubectl create ns backup
```

Create deployment using helm
```
helm upgrade --install pg-backup ./helm/pg-k8s-backup -n backup
```
