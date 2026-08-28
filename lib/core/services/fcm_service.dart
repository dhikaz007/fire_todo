import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../constant/url.dart';
import '../logging/app_logger.dart';
import '../navigation/navigation_service.dart';
import '../user_local/domain/i_hive_repository.dart';

/// Background message handler - must be top-level function
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final log = AppLogger();
  log.i('📱 [BG] FCM message received: ${message.messageId}');
  log.i('📱 [BG] Title: ${message.notification?.title}');
  log.i('📱 [BG] Body: ${message.notification?.body}');
  log.i('📱 [BG] Data: ${message.data}');
}

class FcmService {
  static final FcmService _instance = FcmService._internal();
  factory FcmService() => _instance;
  FcmService._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final AppLogger _log = AppLogger();
  String? _fcmToken;

  String? get fcmToken => _fcmToken;

  /// Initialize FCM - request permission and get token
  Future<void> initialize() async {
    try {
      // Request permission
      final settings = await _messaging.requestPermission();

      _log.i('📱 FCM Permission status: ${settings.authorizationStatus}');

      if (settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional) {
        // Get token
        _fcmToken = await _messaging.getToken();
        _log.i('📱 FCM Token: $_fcmToken');

        // Listen for token refresh
        _messaging.onTokenRefresh.listen((token) {
          _fcmToken = token;
          _log.i('📱 FCM Token refreshed: $token');
          _updateTokenOnServer(token);
        });

        // Handle foreground messages
        _setupForegroundMessageHandler();

        // Handle notification tap (when app is in background/terminated)
        _setupNotificationTapHandler();
      } else {
        _log.w('📱 FCM Permission denied');
      }
    } catch (e) {
      _log.e('📱 FCM initialization error: $e');
    }
  }

  /// Handle messages when app is in foreground
  void _setupForegroundMessageHandler() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _log.i('📱 [FG] FCM message received: ${message.messageId}');
      _log.i('📱 [FG] Title: ${message.notification?.title}');
      _log.i('📱 [FG] Body: ${message.notification?.body}');
      _log.i('📱 [FG] Data: ${message.data}');

      _showLocalNotification(message);
    });
  }

  /// Handle notification tap when app is in background/terminated
  void _setupNotificationTapHandler() {
    // When app is opened from terminated state via notification
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _log.i('📱 [INIT] FCM message: ${message.data}');
        _handleNotificationTap(message.data);
      }
    });

    // When app is in background and notification is tapped
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _log.i('📱 [OPENED] FCM message: ${message.data}');
      _handleNotificationTap(message.data);
    });
  }

  /// Handle navigation when notification is tapped
  void _handleNotificationTap(Map<String, dynamic> data) {
    final todoId = data['todoId'];
    if (todoId != null) {
      // Navigate to todo detail
      NavigationService.navigateTo('/todo/detail');
    }
  }

  /// Show local notification (for foreground messages)
  void _showLocalNotification(RemoteMessage message) {
    // For now, we'll use a snackbar approach
    // In production, you'd use flutter_local_notifications
    _log.i('📱 Showing notification: ${message.notification?.title}');
  }

  /// Update FCM token on Firestore server
  Future<void> _updateTokenOnServer(String token) async {
    try {
      final hiveRepo = inject<IHiveRepository>();
      final user = hiveRepo.getProfileValue();
      if (user == null) return;

      final dio = Dio(BaseOptions(
        baseUrl: UrlApp.fireStoreUrl,
        headers: {
          'Content-Type': 'application/json',
        },
      ));

      // Update user document with FCM token
      await dio.patch(
        '/${UrlApp.projectId}/databases/(default)/documents/users/${user.localId}',
        data: {
          'fields': {
            'fcmToken': {'stringValue': token},
          },
        },
      );

      _log.i('📱 FCM token updated on server for user: ${user.localId}');
    } catch (e) {
      _log.e('📱 Failed to update FCM token on server: $e');
    }
  }

  /// Save FCM token to Firestore (call after login)
  Future<void> saveTokenToFirestore() async {
    if (_fcmToken != null) {
      await _updateTokenOnServer(_fcmToken!);
    }
  }

  /// Subscribe to a topic
  Future<void> subscribeToTopic(String topic) async {
    try {
      await _messaging.subscribeToTopic(topic);
      _log.i('📱 Subscribed to topic: $topic');
    } catch (e) {
      _log.e('📱 Failed to subscribe to topic: $e');
    }
  }

  /// Unsubscribe from a topic
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _messaging.unsubscribeFromTopic(topic);
      _log.i('📱 Unsubscribed from topic: $topic');
    } catch (e) {
      _log.e('📱 Failed to unsubscribe from topic: $e');
    }
  }
}
