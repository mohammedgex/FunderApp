class Property_Model {
  int? id;
  String? name;
  String? description;
  List<String>? images;
  String? fundedDate;
  int? purchasePrice;
  int? funderCount;
  int? rentalIncome;
  int? currentRent;
  int? percent;
  String? locationString;
  int? propertyPriceTotal;
  String? propertyPrice;
  int? transactionCosts;
  int? serviceCharge;
  dynamic status;
  dynamic approved;
  int? categoryId;

  Property_Model({
    this.id,
    this.name,
    this.description,
    this.images,
    this.fundedDate,
    this.purchasePrice,
    this.funderCount,
    this.rentalIncome,
    this.currentRent,
    this.percent,
    this.locationString,
    this.propertyPriceTotal,
    this.propertyPrice,
    this.transactionCosts,
    this.serviceCharge,
    this.status,
    this.approved,
    this.categoryId,
  });

  Property_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    fundedDate = json['funded_date'];
    purchasePrice = json['purchase_price'];
    funderCount = json['funder_count'];
    rentalIncome = json['rental_income'];
    currentRent = json['current_rent'];
    percent = json['percent'];
    locationString = json['location_string'];
    propertyPriceTotal = json['property_price_total'];
    propertyPrice = json['property_price'];
    transactionCosts = json['transaction_costs'];
    serviceCharge = json['service_charge'];
    status = json['status'];
    approved = json['approved'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['images'] = images;
    data['funded_date'] = fundedDate;
    data['purchase_price'] = purchasePrice;
    data['funder_count'] = funderCount;
    data['rental_income'] = rentalIncome;
    data['current_rent'] = currentRent;
    data['percent'] = percent;
    data['location_string'] = locationString;
    data['property_price_total'] = propertyPriceTotal;
    data['property_price'] = propertyPrice;
    data['transaction_costs'] = transactionCosts;
    data['service_charge'] = serviceCharge;
    data['status'] = status;
    data['approved'] = approved;
    data['category_id'] = categoryId;
    return data;
  }
}
