#/bin/bash
container=$(basename $(pwd))

sudo docker-compose up --detach
printf "$container started"

