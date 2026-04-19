import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'constant/color.dart';
import 'routes/app_module.dart';
import 'shared/local_db/domain/models/profile_hive.dart';
import 'shared/logging/app_logger.dart';
import 'shared/widgets/button_double_back.dart';
import 'shared/widgets/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  await initializeDateFormatting();
  await FkUserAgent.init();
  AppLogger.init();
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileHiveAdapter());
  await Hive.openBox<ProfileHive>('PROFILE');

  runApp(
    ModularApp(
      module: AppModule(),
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
    Modular.setInitialRoute('/');
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
            fontFamily: 'Montserrat',
          ),
          routerConfig: Modular.routerConfig,
        ),
      ),
    );
  }
}
