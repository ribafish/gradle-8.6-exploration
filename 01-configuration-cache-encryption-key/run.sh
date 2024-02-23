#!/bin/sh

KEY=$(openssl rand -base64 16)

dockerGradleHelp85() {
  docker run --rm -u gradle -v "$PWD":/home/gradle/project -w /home/gradle/project gradle:8.5 ./gradlew -g gradle_home help
}

dockerGradleHelp86() {
  docker run --rm -u gradle -v "$PWD":/home/gradle/project -w /home/gradle/project -e GRADLE_ENCRYPTION_KEY="${KEY}" gradle:8.6 ./gradlew -g gradle_home help
}

setupGradle() {
  rm -rf build
  rm -rf .gradle
  rm -rf gradle_home
  mkdir -p gradle_home/enterprise
  cp ~/.gradle/enterprise/keys.properties gradle_home/enterprise/keys.properties
  cp ~/.gradle/gradle.properties gradle_home/gradle.properties
  sleep 1
  echo "======================== Gradle setup complete ======================"
}

cleanAndRestore() {
  rm -rf build
  rm -rf gradle_home2
  mkdir gradle_home2
  cd 'gradle_home'

  cp -r --parents caches/*/generated-gradle-jars ../gradle_home2/
  cp -r --parents caches/*/kotlin-dsl ../gradle_home2/
  cp -r --parents caches/modules-* ../gradle_home2/
  cp -r --parents caches/transforms-* ../gradle_home2/
  cp -r --parents caches/jars-* ../gradle_home2/
  cp -r --parents caches/build-cache-* ../gradle_home2/

  cp -r --parents enterprise ../gradle_home2/
  cp -r --parents gradle.properties ../gradle_home2/
  cp -r --parents wrapper ../gradle_home2/

  cd ".."
  rm -rf gradle_home
  mv gradle_home2 gradle_home
  sleep 1
  echo "======================== Gradle clean complete ======================"
}

cd '01-gradle-8.5'
echo "======================== Running Gradle 8.5 ======================"
setupGradle
echo "======================== First run ======================"
dockerGradleHelp85
cleanAndRestore
echo "======================== Second run ======================"
dockerGradleHelp85

cd '../01-gradle-8.6'
echo "======================== Running Gradle 8.6 ======================"
setupGradle
echo "======================== First run ======================"
dockerGradleHelp86
cleanAndRestore
echo "======================== Second run ======================"
dockerGradleHelp86
