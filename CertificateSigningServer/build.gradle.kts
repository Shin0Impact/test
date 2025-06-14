plugins {
    id("java")
    application
    id("com.github.johnrengelman.shadow") version "7.1.2"
}

group = "il.ac.kinneret"
version = "5785"

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(platform("org.junit:junit-bom:5.10.0"))
    testImplementation("org.junit.jupiter:junit-jupiter")
}

tasks.test {
    useJUnitPlatform()
}

application {
    mainClass.set("il.ac.kinneret.certificateSigningServer.Main")
}

tasks.withType<Jar> {
    manifest {
        attributes["Main-Class"] = "il.ac.kinneret.certificateSigningServer.Main"
    }
}

tasks.named<com.github.jengelman.gradle.plugins.shadow.tasks.ShadowJar>("shadowJar") {
    archiveBaseName.set("CertificateSigningServer")
    archiveClassifier.set("all")
    archiveVersion.set("5785")
}
