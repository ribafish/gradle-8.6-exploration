#!/bin/sh

docker run --rm -u gradle -v "$PWD":/home/gradle/project -w /home/gradle/project gradle:8.5 gradle help --task init

echo "\n###############################################################################################################"

docker run --rm -u gradle -v "$PWD":/home/gradle/project -w /home/gradle/project gradle:8.6 gradle help --task init
