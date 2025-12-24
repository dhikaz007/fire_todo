part of 'extensions.dart';

extension DateExtension on DateTime {
  String getFullDate() {
    return DateFormat('dd MMM y, HH:mm a').format(this);
  }
  String ddMMMy() {
    return DateFormat('dd MMM y').format(this);
  }
}
