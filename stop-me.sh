#!/bin/bash
container=$(basename $(pwd))
docker kill $container
