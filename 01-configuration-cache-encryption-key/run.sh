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
  rm -rf gradle_home
  mkdir -p gradle_home/enterprise
  cp ~/.gradle/enterprise/keys.properties gradle_home/enterprise/keys.properties
  cp ~/.gradle/gradle.properties gradle_home/gradle.properties
  sleep 1
  echo "======================== Gradle setup complete ======================"
}

cd '01-gradle-8.5'
rm -rf .gradle
echo "======================== Running Gradle 8.5 ======================"
echo "======================== First run ======================"
setupGradle
dockerGradleHelp85
echo "======================== Second run ======================"
setupGradle
dockerGradleHelp85

cd '../01-gradle-8.6'
rm -rf .gradle
echo "======================== Running Gradle 8.6 ======================"
echo "======================== First run ======================"
setupGradle
dockerGradleHelp86
echo "======================== Second run ======================"
setupGradle
dockerGradleHelp86
