#!/bin/sh

rm -rf 02-gradle-8.5
rm -rf 02-gradle-8.6

mkdir 02-gradle-8.5
mkdir 02-gradle-8.6
cp -r gradle_home/ 02-gradle-8.6/

cd 02-gradle-8.5

set -x

docker run --rm -it -u gradle -v "$PWD":/home/gradle/project -w /home/gradle/project gradle:8.5 gradle init --type kotlin-application

set +x

cd ../02-gradle-8.6

set -x

docker run --rm -it -u gradle -v "$PWD":/home/gradle/project -w /home/gradle/project gradle:8.6 gradle -g gradle_home init --type kotlin-application --use-defaults
