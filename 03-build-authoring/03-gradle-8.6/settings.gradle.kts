/*
 * This file was generated by the Gradle 'init' task.
 *
 * The settings file is used to specify which projects to include in your build.
 * For more detailed information on multi-project builds, please refer to https://docs.gradle.org/8.6/userguide/multi_project_builds.html in the Gradle documentation.
 */

plugins {
    // Apply the foojay-resolver plugin to allow automatic download of JDKs
    id("org.gradle.toolchains.foojay-resolver-convention") version "0.7.0"
    id("com.gradle.enterprise") version "3.16.2"
}

rootProject.name = "03-build-authoring-8.6"
include("app")

gradleEnterprise {
    server = "https://ge.solutions-team.gradle.com"

    buildScan {
        publishAlways()
    }
}
