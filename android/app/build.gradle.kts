import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    // id("com.google.gms.google-services")
}

val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.inputStream().use { localProperties.load(it) }
}

val flutterVersionCode = localProperties.getProperty("flutter.versionCode")?.toIntOrNull() ?: 1
val flutterVersionName = localProperties.getProperty("flutter.versionName") ?: "1.0"

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(keystorePropertiesFile.inputStream())
}

android {
    namespace = "com.example.fire_todo"
    compileSdk = flutter.compileSdkVersion
    // Pakai build-tools terbaru yang sudah terinstall (AGP 8.11 min=35.0.0)
    buildToolsVersion = "36.1.0"
    // NDK 28.2 wajib dipakai karena integration_test & jni plugin membutuhkan
    ndkVersion = "28.2.13676358"

    compileOptions {
        // Java 17 supaya sinkron dengan root build.gradle
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "id.dhikaz.fire_todo"
        // You can update the following values to match your application needs.
        // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-gradle-build-configuration.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutterVersionCode
        versionName = flutterVersionName

        // testInstrumentationRunner = "pl.leancode.patrol.PatrolJUnitRunner"
        // testInstrumentationRunnerArguments["clearPackageData"] = "true"
    }

    flavorDimensions += "env"

    signingConfigs {
        create("release") {
            if (keystorePropertiesFile.exists()) {
                keyAlias = keystoreProperties["keyAlias"] as? String
                keyPassword = keystoreProperties["keyPassword"] as? String
                storeFile = file(keystoreProperties["storeFile"] as String)
                storePassword = keystoreProperties["storePassword"] as? String
            }
        }
    }

    productFlavors {
        create("dev") {
            dimension = "env"
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
            resValue("string", "app_name", "Fire Todo Dev")
        }
        create("prod") {
            dimension = "env"
            resValue("string", "app_name", "Fire Todo")
        }
    }

    buildTypes {
        debug {
            // Optimasi debug build: minify & shrink OFF, crunch PNG OFF
            isCrunchPngs = false
            isMinifyEnabled = false
        }
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = if (keystorePropertiesFile.exists()) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
            isCrunchPngs = false
        }
    }

    lint {
        // Skip lint saat dev build -> lebih cepat
        abortOnError = false
        checkReleaseBuilds = false
        htmlReport = false
        xmlReport = false
        textReport = false
    }

    configurations.all {
        resolutionStrategy {
            force("androidx.core:core-ktx:1.13.1")
            force("androidx.core:core:1.13.1")
            force("androidx.browser:browser:1.8.0")
        }
    }

    // testOptions {
    //     execution = "ANDROIDX_TEST_ORCHESTRATOR"
    // }
}

dependencies {
    // androidTestUtil("androidx.test:orchestrator:1.5.1")
    // implementation(platform("com.google.firebase:firebase-bom:34.1.0"))
    // implementation("com.google.firebase:firebase-analytics")
}

flutter {
    source = "../.."
}
