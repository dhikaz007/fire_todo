part of 'services.dart';

class ErrorResponseModel {
  final int? code;
  final String? message;
  final List<ErrorElement>? errors;
  final String? status;

  const ErrorResponseModel({
    this.code,
    this.message,
    this.errors,
    this.status,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      ErrorResponseModel(
        code: json["code"],
        message: json["message"],
        errors: json["errors"] == null
            ? []
            : List<ErrorElement>.from(json["errors"]?.map(
                (x) => ErrorElement.fromJson(x),
              )),
        status: json['status'],
      );

  @override
  String toString() =>
      'ErrorResponseModel(code: $code, message: $message, errors: $errors, status: $status)';
}

class ErrorElement {
  final String? message;
  final String? domain;
  final String? reason;

  const ErrorElement({
    this.message,
    this.domain,
    this.reason,
  });

  factory ErrorElement.fromJson(Map<String, dynamic> json) => ErrorElement(
        message: json["message"],
        domain: json["domain"],
        reason: json["reason"],
      );

  @override
  String toString() =>
      'ErrorElement(message: $message, domain: $domain, reason: $reason)';
}
