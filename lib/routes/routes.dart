import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../feature/auth/cubit/auth_cubit.dart';
import '../feature/auth/domain/services/services.dart';
import '../feature/auth/screens/screens.dart';
import '../feature/home/screens/screens.dart';
import '../feature/notifications/screens/screens.dart';
import '../feature/profile/cubit/profile_cubit.dart';
import '../feature/profile/domain/services/services.dart';
import '../feature/profile/screens/screens.dart';
import '../feature/todo/cubit/todo_cubit.dart';
import '../feature/todo/domain/services/services.dart';
import '../feature/todo/screens/screens.dart';
import '../hive/boxes.dart';
import '../shared/shared.dart';
import '../storage/storage.dart';

part 'app_module.dart';
part 'auth_guard.dart';
part 'auth_module.dart';
part 'notifications_module.dart';
part 'profile_module.dart';
part 'services_module.dart';
part 'todo_module.dart';
