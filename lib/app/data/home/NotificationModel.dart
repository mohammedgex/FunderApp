class NotificationModel {
  final String id;
  final String type;
  final String notifiableType;
  final int notifiableId;
  final NotificationData data;
  final DateTime? readAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotificationModel({
    required this.id,
    required this.type,
    required this.notifiableType,
    required this.notifiableId,
    required this.data,
    this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      type: json['type'],
      notifiableType: json['notifiable_type'],
      notifiableId: json['notifiable_id'],
      data: NotificationData.fromJson(json['data']),
      readAt: json['read_at'] != null ? DateTime.parse(json['read_at']) : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'notifiable_type': notifiableType,
      'notifiable_id': notifiableId,
      'data': data.toJson(),
      'read_at': readAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class NotificationData {
  final String title;
  final String body;
  final String propertyId;

  NotificationData({
    required this.title,
    required this.body,
    required this.propertyId,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      title: json['title'],
      body: json['body'],
      propertyId: json['property_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'property_id': propertyId,
    };
  }
}
