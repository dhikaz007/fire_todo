import 'package:flutter_dotenv/flutter_dotenv.dart';

class UrlApp {
  static const baseUrl = 'https://identitytoolkit.googleapis.com/v1';
  static const authPath = '/accounts';
  static const fireStoreUrl = 'https://firestore.googleapis.com/v1/projects';
  static final String apiKey =
      dotenv.env['FIREBASE_API_KEY'] ?? 'API_KEY_NOT_FOUND';
  static final projectId =
      dotenv.env['FIREBASE_PROJECT_ID'] ?? 'PROJECT_ID_NOT_FOUND';
  static final collectionUrl =
      '/$projectId/databases/(default)/documents/users';
  static const secureTokenUrl = 'https://securetoken.googleapis.com/v1/token';
}
