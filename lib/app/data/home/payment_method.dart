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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['bank'] = this.bank;
    data['account_number'] = this.accountNumber;
    return data;
  }
}
