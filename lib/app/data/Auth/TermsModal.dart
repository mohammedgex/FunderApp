class TermModal {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  TermModal({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TermModal.fromJson(Map<String, dynamic> json) {
    return TermModal(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
