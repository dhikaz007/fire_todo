allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.google.gms:google-services:4.4.2")
    }
}

rootProject.layout.buildDirectory.set(file("../build"))

subprojects {
    layout.buildDirectory.set(file("${rootProject.layout.buildDirectory.get().asFile}/${project.name}"))

    afterEvaluate {
        // ── Java 17 untuk semua Android module ──────────────────────
        if (plugins.hasPlugin("com.android.application")) {
            extensions.configure<com.android.build.gradle.internal.dsl.BaseAppModuleExtension> {
                compileOptions {
                    sourceCompatibility = JavaVersion.VERSION_17
                    targetCompatibility = JavaVersion.VERSION_17
                }

                // Patch namespace untuk plugin lama yang belum support namespace
                if (namespace == null) {
                    when (project.name) {
                        "flutter_jailbreak_detection" -> namespace = "com.btnsmartmobile.jailbreakdetection"
                    }
                }
            }
        } else if (plugins.hasPlugin("com.android.library")) {
            extensions.configure<com.android.build.gradle.LibraryExtension> {
                compileOptions {
                    sourceCompatibility = JavaVersion.VERSION_17
                    targetCompatibility = JavaVersion.VERSION_17
                }

                // Patch namespace untuk plugin lama yang belum support namespace
                if (namespace == null) {
                    when (project.name) {
                        "flutter_jailbreak_detection" -> namespace = "com.btnsmartmobile.jailbreakdetection"
                    }
                }
            }
        }

        // ── Kotlin: paksa JVM target 17 via compilerOptions DSL ────
        plugins.withId("org.jetbrains.kotlin.android") {
            tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
                compilerOptions {
                    jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
                }
            }
            extensions.configure<org.jetbrains.kotlin.gradle.dsl.KotlinProjectExtension> {
                jvmToolchain(17)
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
