// part of 'services.dart';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_api.freezed.dart';

@Freezed(genericArgumentFactories: true, toStringOverride: true)
class ResponseAPI<T> with _$ResponseAPI<T> {
  const factory ResponseAPI({T? data}) = _ResponseAPI<T>;

  factory ResponseAPI.fromValue(T value) => ResponseAPI(data: value);
}

class ApiException implements Exception {
  final String message;
  final DioException original;
  const ApiException(this.message, this.original);

  @override
  String toString() => message;
}
