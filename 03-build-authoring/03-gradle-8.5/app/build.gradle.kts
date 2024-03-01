/*
 * This file was generated by the Gradle 'init' task.
 *
 * This generated file contains a sample Kotlin application project to get you started.
 * For more details on building Java & JVM projects, please refer to https://docs.gradle.org/8.5/userguide/building_java_projects.html in the Gradle documentation.
 */

plugins {
    // Apply the org.jetbrains.kotlin.jvm Plugin to add support for Kotlin.
    alias(libs.plugins.jvm)

    // Apply the application plugin to add support for building a CLI application in Java.
    application
}

repositories {
    // Use Maven Central for resolving dependencies.
    mavenCentral()
}

dependencies {
    // Use the Kotlin JUnit 5 integration.
    testImplementation("org.jetbrains.kotlin:kotlin-test-junit5")

    // Use the JUnit 5 integration.
    testImplementation(libs.junit.jupiter.engine)

    testRuntimeOnly("org.junit.platform:junit-platform-launcher")

    // This dependency is used by the application.
    implementation(libs.guava) {
        capabilities {
            // Implicitly provided by guava lib
            requireCapability("com.google.collections:google-collections:32.1.2-jre")
            // Not supported in Gradle 8.5:
//            requireCapability(project.provider { project.ext.get("guavaCapability") })
        }
    }
}

// Apply a specific Java toolchain to ease working on different environments.
java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

application {
    // Define the main class for the application.
    mainClass.set("build.authoring.AppKt")
}

tasks.named<Test>("test") {
    // Use JUnit Platform for unit tests.
    useJUnitPlatform()
}

tasks.register("unrelatedTest") {
    println("Unrelated task created")
    val out = layout.buildDirectory.file("unrelated.txt")
    outputs.file(out)
    doLast {
        out.get().asFile.writeText("unrelated")
    }
}

tasks.matching { it.name.contains("test", ignoreCase = true) }.configureEach {
    // configure details of all '*test*' tasks that are part of the task graph
    doLast {
        println("Added configuration")
    }
}
