import 'dart:async';
import 'dart:convert';

import 'package:device_user_agent/device_user_agent.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

import '../constant/constant.dart';
import '../routes/routes.dart';
import '../storage/storage.dart';

export 'response_api.dart';

part 'app_logger.dart';
part 'base_services.dart';
part 'error_response_model.dart';
