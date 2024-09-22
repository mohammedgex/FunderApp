class UserModel {
  final int id;
  final String name;
  final String image;
  final String phone;
  final String email;
  final String? emailVerifiedAt;
  final String? identificationVerifiedAt;
  final String? twoFactorSecret;
  final String? twoFactorRecoveryCodes;
  final String? twoFactorConfirmedAt;
  final String? socialId;
  final String? socialType;
  final String createdAt;
  final String updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.image,
    required this.phone,
    required this.email,
    this.emailVerifiedAt,
    this.identificationVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.socialId,
    this.socialType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      phone: json['phone'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      identificationVerifiedAt: json['identification_verified_at'] ?? "null",
      twoFactorSecret: json['two_factor_secret'],
      twoFactorRecoveryCodes: json['two_factor_recovery_codes'],
      twoFactorConfirmedAt: json['two_factor_confirmed_at'],
      socialId: json['social_id'],
      socialType: json['social_type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
