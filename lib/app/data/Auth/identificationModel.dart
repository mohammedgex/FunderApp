class IdentificationModel {
  int? id;
  String? frontSide;
  String? backSide;
  String? type;
  String? status;
  String? notes;

  int? userId;
  String? createdAt;
  String? updatedAt;

  IdentificationModel({
    this.id,
    this.frontSide,
    this.backSide,
    this.type,
    this.status,
    this.userId,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor to create an Identification object from JSON
  factory IdentificationModel.fromJson(Map<String, dynamic> json) {
    return IdentificationModel(
      id: json['id'],
      frontSide: json['front_side'],
      backSide: json['back_side'],
      type: json['type'],
      status: json['status'],
      notes: json['notes'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
