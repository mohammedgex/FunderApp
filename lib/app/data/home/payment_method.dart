class paymentMethod_model {
  int? id;
  String? title;
  String? description;
  String? bank;
  String? accountNumber;

  paymentMethod_model(
      {this.id, this.title, this.description, this.bank, this.accountNumber});

  paymentMethod_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    bank = json['bank'];
    accountNumber = json['account_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['bank'] = bank;
    data['account_number'] = accountNumber;
    return data;
  }
}
