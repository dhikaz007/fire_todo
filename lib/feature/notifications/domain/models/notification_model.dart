/// Model for the Notifications feature.
class NotificationModel {
  final String? id;
  final String? title;
  final String? body;
  final String? type;
  final String? time;
  final bool isRead;
  final DateTime? createdAt;

  const NotificationModel({
    this.id,
    this.title,
    this.body,
    this.type,
    this.time,
    this.isRead = false,
    this.createdAt,
  });

  NotificationModel copyWith({
    String? title,
    String? body,
    String? type,
    String? time,
    bool? isRead,
  }) {
    return NotificationModel(
      id: id,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      time: time ?? this.time,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt,
    );
  }
}
