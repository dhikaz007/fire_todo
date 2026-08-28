# Firebase Setup - Fire Todo

## Prerequisites

- [FlutterFire CLI](https://firebase.flutter.dev/docs/overview#installation) installed
- Firebase project created in [Firebase Console](https://console.firebase.google.com/)
- Android Studio / VS Code

---

## Step 1: Install FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

---

## Step 2: Create Firebase Projects

### Fire Todo (Prod)
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project"
3. Name: `Fire Todo`
4. Enable Google Analytics (optional)
5. Create project

### Fire Todo Dev
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project"
3. Name: `Fire Todo Dev`
4. Enable Google Analytics (optional)
5. Create project

---

## Step 3: Add Android Apps

### Fire Todo (Prod)
1. In Firebase Console, click "Add app" → Android
2. Register app:
   - **Android package name**: `id.dhikaz.fire_todo`
   - **App nickname**: `Fire Todo`
   - **Debug signing certificate SHA-1**: (optional, for Google Sign-In)
3. Download `google-services.json`
4. Place in: `android/app/google-services.json`

### Fire Todo Dev
1. In Firebase Console, click "Add app" → Android
2. Register app:
   - **Android package name**: `id.dhikaz.fire_todo.dev`
   - **App nickname**: `Fire Todo Dev`
   - **Debug signing certificate SHA-1**: (optional)
3. Download `google-services.json`
4. Place in: `android/app/src/dev/google-services.json`

---

## Step 4: Enable FlutterFire CLI

### Add Firebase to your Flutter project

```bash
cd fire_todo
flutterfire configure
```

When prompted:
1. Select your Firebase project: `Fire Todo` (prod)
2. Select the Android app: `id.dhikaz.fire_todo`
3. Firebase will generate `firebase_options.dart`

### For Dev Flavor

```bash
flutterfire configure --project=fire-todo-dev
```

When prompted:
1. Select the Android app: `id.dhikaz.fire_todo.dev`
2. Firebase will generate `firebase_options_dev.dart`

---

## Step 5: Update pubspec.yaml

Add Firebase dependencies:

```yaml
dependencies:
  firebase_core: ^3.12.1
  firebase_auth: ^5.5.4
  cloud_firestore: ^5.6.5

dev_dependencies:
  flutterfire_cli: ^0.3.0
```

Then run:
```bash
flutter pub get
```

---

## Step 6: Configure Android Build Files

### android/build.gradle.kts (Project-level)

Add Google Services classpath:

```kotlin
plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // Add this
}
```

### android/app/build.gradle.kts (App-level)

```kotlin
plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    // id("com.google.gms.google-services") // Apply in defaultConfig
}

android {
    // ... existing config ...

    defaultConfig {
        // ... existing config ...
    }

    // Apply google-services plugin conditionally
    afterEvaluate {
        apply(plugin = "com.google.gms.google-services")
    }
}
```

---

## Step 7: Update main.dart

```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'firebase_options_dev.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');

  // Initialize Firebase based on flavor
  switch (flavor) {
    case 'prod':
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      break;
    case 'dev':
    default:
      await Firebase.initializeApp(
        options: DefaultFirebaseOptionsDev.currentPlatform,
      );
      break;
  }

  // ... rest of your app
  runApp(MyApp(flavor: flavor));
}
```

---

## Step 8: Create firebase_options.dart Files

### For Prod (`lib/firebase_options.dart`)

```dart
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'YOUR_API_KEY',
    appId: 'YOUR_APP_ID',
    messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
    projectId: 'YOUR_PROJECT_ID',
    storageBucket: 'YOUR_STORAGE_BUCKET',
  );
}
```

### For Dev (`lib/firebase_options_dev.dart`)

```dart
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptionsDev {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptionsDev are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'YOUR_DEV_API_KEY',
    appId: 'YOUR_DEV_APP_ID',
    messagingSenderId: 'YOUR_DEV_MESSAGING_SENDER_ID',
    projectId: 'YOUR_DEV_PROJECT_ID',
    storageBucket: 'YOUR_DEV_STORAGE_BUCKET',
  );
}
```

---

## Step 9: Run the App

### For Prod Flavor
```bash
flutter run --flavor prod -t lib/main.dart
```

### For Dev Flavor
```bash
flutter run --flavor dev -t lib/main.dart
```

---

## Step 10: Verify Firebase Connection

1. Run the app
2. Check console for Firebase initialization logs
3. Verify in Firebase Console that the app is connected

---

## File Structure

```
android/
├── app/
│   ├── google-services.json          # Prod config (for prod flavor)
│   └── src/
│       └── dev/
│           └── google-services.json  # Dev config
└── ...

lib/
├── firebase_options.dart              # Prod Firebase options
├── firebase_options_dev.dart          # Dev Firebase options
└── main.dart                          # Flavor-based initialization
```

---

## Troubleshooting

### Issue: "No Firebase App '[DEFAULT]' has been created"
- Make sure `Firebase.initializeApp()` is called before using any Firebase services
- Check that the correct `firebase_options.dart` is imported

### Issue: "google-services.json not found"
- Ensure the file is in the correct location:
  - Prod: `android/app/google-services.json`
  - Dev: `android/app/src/dev/google-services.json`

### Issue: Build fails with "Duplicate class"
- Run `flutter clean && flutter pub get`
- Ensure only one `google-services.json` is active per flavor

---

## Next Steps

1. Configure Firebase Authentication
2. Set up Cloud Firestore
3. Configure Firebase Cloud Messaging (optional)
4. Set up Firebase Analytics (optional)

---

## References

- [FlutterFire Documentation](https://firebase.flutter.dev/docs/overview)
- [FlutterFire CLI](https://firebase.flutter.dev/docs/cli)
- [Firebase Android Setup](https://firebase.google.com/docs/android/setup)
