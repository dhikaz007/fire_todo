import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'core/constant/color.dart';
import 'core/services/fcm_service.dart';
import 'core/user_local/domain/models/profile_hive.dart';
import 'core/logging/app_logger.dart';
import 'core/logging/app_bloc_observer.dart';
import 'core/navigation/app_navigator_observer.dart';
import 'core/navigation/navigation_service.dart';
import 'core/widgets/button_double_back.dart';
import 'core/widgets/loading.dart';
import 'app/app_module.dart';
import 'firebase_options.dart';
import 'gen/assets.gen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  await initializeDateFormatting();

  // Initialize Firebase based on flavor
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Register FCM background handler
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  AppLogger.init();
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileHiveAdapter());
  await Hive.openBox<ProfileHive>('PROFILE');

  Bloc.observer = AppBlocObserver();  runApp(
    ModularApp(
      module: appModule,
      navigatorKey: NavigationService.navigatorKey,
      navigatorObservers: [AppNavigatorObserver()],
      child: const MainApp(flavor: flavor),
    ),
  );
}

class MainApp extends StatefulWidget {
  final String flavor;
  const MainApp({super.key, required this.flavor});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    // Initialize FCM after Modular is ready
    _initFcm();
  }

  Future<void> _initFcm() async {
    try {
      final fcmService = inject<FcmService>();
      await fcmService.initialize();
    } catch (e) {
      AppLogger().w('FCM init failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayColor: Colors.black87.withValues(alpha: .8),
      overlayWidgetBuilder: (progress) => const LoadingApp(),
      child: ButtonDoubleBack(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Fire Todo ${widget.flavor}',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: ColorApp.primary(50)),
            fontFamily: Assets.fonts.montserratRegular,
          ),
          routerConfig: ModularApp.routerConfigOf(context),
        ),
      ),
    );
  }
}
