class reciptsmodel {
  int? id;
  int? countSheres;
  String? method;
  String? image;
  String? receiptNumber;
  String? depositDate;
  String? depositedAmount;
  String? status;
  int? userId;
  int? propertyId;

  reciptsmodel({
    this.id,
    this.countSheres,
    this.method,
    this.image,
    this.receiptNumber,
    this.depositDate,
    this.depositedAmount,
    this.status,
    this.userId,
    this.propertyId,
  });

  reciptsmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countSheres = json['count_sheres'];
    method = json['method'];
    image = json['image'];
    receiptNumber = json['receipt_number'];
    depositDate = json['deposit_date'];
    depositedAmount = json['deposited_amount'];
    status = json['status'];
    userId = json['user_id'];
    propertyId = json['property_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['count_sheres'] = countSheres;
    data['method'] = method;
    data['image'] = image;
    data['receipt_number'] = receiptNumber;
    data['deposit_date'] = depositDate;
    data['deposited_amount'] = depositedAmount;
    data['status'] = status;
    data['user_id'] = userId;
    data['property_id'] = propertyId;

    return data;
  }
}
