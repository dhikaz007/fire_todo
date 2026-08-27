/// Placeholder model for the Notifications feature.
///
/// Can be extended with actual notification data fields when needed.
class NotificationModel {
  final String? id;
  final String? title;
  final String? body;
  final DateTime? createdAt;

  const NotificationModel({
    this.id,
    this.title,
    this.body,
    this.createdAt,
  });
}
