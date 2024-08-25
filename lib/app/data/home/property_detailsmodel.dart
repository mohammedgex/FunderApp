class property_detailsmodel {
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
  String? discount;
  String? estimatedAnnualisedReturn;
  String? estimatedAnnualAppreciation;
  String? estimatedProjectedGrossYield;
  int? transactionCosts;
  int? serviceCharge;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  List<Funders>? funders;
  List<Timelines>? timelines;
  Location? location;
  bool? ifUserShared;
  String? status;
  bool? approved;

  property_detailsmodel(
      {this.id,
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
      this.discount,
      this.estimatedAnnualisedReturn,
      this.estimatedAnnualAppreciation,
      this.estimatedProjectedGrossYield,
      this.transactionCosts,
      this.serviceCharge,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.funders,
      this.timelines,
      this.location,
      this.ifUserShared,
      this.status,
      this.approved});

  property_detailsmodel.fromJson(Map<String, dynamic> json) {
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
    discount = json['discount'];
    estimatedAnnualisedReturn = json['estimated_annualised_return'];
    estimatedAnnualAppreciation = json['estimated_annual_appreciation'];
    estimatedProjectedGrossYield = json['estimated_projected_gross_yield'];
    transactionCosts = json['transaction_costs'];
    serviceCharge = json['service_charge'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['funders'] != null) {
      funders = <Funders>[];
      json['funders'].forEach((v) {
        funders!.add(new Funders.fromJson(v));
      });
    }
    if (json['timelines'] != null) {
      timelines = <Timelines>[];
      json['timelines'].forEach((v) {
        timelines!.add(new Timelines.fromJson(v));
      });
    }
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    ifUserShared = json['if_user_shared'];
    status = json['status'];
    approved = json['approved'];
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
    data['discount'] = this.discount;
    data['estimated_annualised_return'] = this.estimatedAnnualisedReturn;
    data['estimated_annual_appreciation'] = this.estimatedAnnualAppreciation;
    data['estimated_projected_gross_yield'] = this.estimatedProjectedGrossYield;
    data['transaction_costs'] = this.transactionCosts;
    data['service_charge'] = this.serviceCharge;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.funders != null) {
      data['funders'] = this.funders!.map((v) => v.toJson()).toList();
    }
    if (this.timelines != null) {
      data['timelines'] = this.timelines!.map((v) => v.toJson()).toList();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['if_user_shared'] = this.ifUserShared;
    data['status'] = this.status;
    data['approved'] = this.approved;
    return data;
  }
}

class Funders {
  int? id;
  int? propertyId;
  int? userId;
  String? status;
  String? createdAt;
  String? updatedAt;

  Funders(
      {this.id,
      this.propertyId,
      this.userId,
      this.status,
      this.createdAt,
      this.updatedAt});

  Funders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_id'] = this.propertyId;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Timelines {
  int? id;
  String? date;
  String? title;
  String? description;
  int? propertyId;
  String? createdAt;
  String? updatedAt;

  Timelines(
      {this.id,
      this.date,
      this.title,
      this.description,
      this.propertyId,
      this.createdAt,
      this.updatedAt});

  Timelines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    title = json['title'];
    description = json['description'];
    propertyId = json['property_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['title'] = this.title;
    data['description'] = this.description;
    data['property_id'] = this.propertyId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Location {
  int? id;
  double? latitude;
  double? longitude;
  int? propertyId;
  String? createdAt;
  String? updatedAt;

  Location(
      {this.id,
      this.latitude,
      this.longitude,
      this.propertyId,
      this.createdAt,
      this.updatedAt});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    propertyId = json['property_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['property_id'] = this.propertyId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
