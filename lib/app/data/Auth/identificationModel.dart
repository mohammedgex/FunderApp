class IdentificationModel {
  int? id;
  String? frontSide;
  String? backSide;
  String? type;
  String? status;
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
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  // Method to convert Identification object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'front_side': frontSide,
      'back_side': backSide,
      'type': type,
      'status': status,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
