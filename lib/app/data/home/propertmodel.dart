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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['images'] = this.images;
    data['funded_date'] = this.fundedDate;
    data['purchase_price'] = this.purchasePrice;
    data['funder_count'] = this.funderCount;
    data['rental_income'] = this.rentalIncome;
    data['current_rent'] = this.currentRent;
    data['percent'] = this.percent;
    data['location_string'] = this.locationString;
    data['property_price_total'] = this.propertyPriceTotal;
    data['property_price'] = this.propertyPrice;
    data['transaction_costs'] = this.transactionCosts;
    data['service_charge'] = this.serviceCharge;
    data['status'] = this.status;
    data['approved'] = this.approved;
    data['category_id'] = this.categoryId;
    return data;
  }
}
