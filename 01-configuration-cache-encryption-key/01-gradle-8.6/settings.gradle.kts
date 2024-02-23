plugins {
    id("com.gradle.enterprise") version "3.16.2"
}

rootProject.name = "01-gradle-8.6"

gradleEnterprise {
    server = "https://ge.solutions-team.gradle.com"

    buildScan {
        publishAlways()
    }
}
