class NotificationModel {
  final int id;
  final String title;
  final String body;
  final String type;
  final DateTime createdAt;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.createdAt,
    required this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> jsonData) {
    return NotificationModel(
      id: jsonData['id'],
      title: jsonData['title'],
      body: jsonData['body'],
      type: jsonData['type'],
      createdAt: DateTime.parse(jsonData['created_at']),
      isRead: jsonData['is_read'],
    );
  }
}
