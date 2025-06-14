plugins {
    id("java")
    id("application")
    id("com.github.johnrengelman.shadow") version "8.1.1"
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
    mainClass.set("il.ac.kinneret.certificateSigningClient.Main")
}

tasks.withType<Jar> {
    manifest {
        attributes["Main-Class"] = "il.ac.kinneret.certificateSigningClient.Main"
    }
}
