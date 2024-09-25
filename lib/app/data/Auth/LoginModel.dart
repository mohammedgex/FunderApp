class LoginModel {
  String? token;
  User? user;

  LoginModel({this.token, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? image;
  String? phone;
  String? email;

  User({
    this.id,
    this.name,
    this.image,
    this.phone,
    this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['phone'] = phone;
    data['email'] = email;

    return data;
  }
}
