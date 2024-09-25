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
  String? location_longitude;
  String? location_latitude;
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
    location_latitude = json["location_latitude"];
    location_longitude = json["location_longitude"];
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
        funders!.add(Funders.fromJson(v));
      });
    }
    if (json['timelines'] != null) {
      timelines = <Timelines>[];
      json['timelines'].forEach((v) {
        timelines!.add(Timelines.fromJson(v));
      });
    }
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    ifUserShared = json['if_user_shared'];
    status = json['status'];
    approved = json['approved'];
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
    data['discount'] = discount;
    data['estimated_annualised_return'] = estimatedAnnualisedReturn;
    data['estimated_annual_appreciation'] = estimatedAnnualAppreciation;
    data['estimated_projected_gross_yield'] = estimatedProjectedGrossYield;
    data['transaction_costs'] = transactionCosts;
    data['service_charge'] = serviceCharge;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (funders != null) {
      data['funders'] = funders!.map((v) => v.toJson()).toList();
    }
    if (timelines != null) {
      data['timelines'] = timelines!.map((v) => v.toJson()).toList();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['if_user_shared'] = ifUserShared;
    data['status'] = status;
    data['approved'] = approved;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['user_id'] = userId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['title'] = title;
    data['description'] = description;
    data['property_id'] = propertyId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['property_id'] = propertyId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
