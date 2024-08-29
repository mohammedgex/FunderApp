import 'package:funder_app/app/data/home/propertmodel.dart';

class FavoriteModel {
  int? id;
  int? userId;
  int? propertyId;
  String? createdAt;
  String? updatedAt;
  Property_Model? property;

  FavoriteModel({
    this.id,
    this.userId,
    this.propertyId,
    this.createdAt,
    this.updatedAt,
    this.property,
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    propertyId = json['property_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    property = json['property'] != null
        ? Property_Model.fromJson(json['property'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['property_id'] = propertyId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (property != null) {
      data['property'] = property!.toJson();
    }
    return data;
  }
}

// class Property_Model {
//   int? id;
//   String? name;
//   String? description;
//   List<String>? images;
//   String? fundedDate;
//   int? purchasePrice;
//   int? funderCount;
//   int? rentalIncome;
//   int? currentRent;
//   int? percent;
//   String? locationString;
//   int? propertyPriceTotal;
//   String? propertyPrice;
//   String? currentEvaluation;
//   String? discount;
//   String? estimatedAnnualisedReturn;
//   String? estimatedAnnualAppreciation;
//   String? estimatedProjectedGrossYield;
//   int? serviceCharge;
//   String? status;
//   String? approved; // Added approved field
//   int? categoryId;
//   String? createdAt;
//   String? updatedAt;

//   Property_Model({
//     this.id,
//     this.name,
//     this.description,
//     this.images,
//     this.fundedDate,
//     this.purchasePrice,
//     this.funderCount,
//     this.rentalIncome,
//     this.currentRent,
//     this.percent,
//     this.locationString,
//     this.propertyPriceTotal,
//     this.propertyPrice,
//     this.currentEvaluation,
//     this.discount,
//     this.estimatedAnnualisedReturn,
//     this.estimatedAnnualAppreciation,
//     this.estimatedProjectedGrossYield,
//     this.serviceCharge,
//     this.status,
//     this.approved, // Initialize approved field
//     this.categoryId,
//     this.createdAt,
//     this.updatedAt,
//   });

//   Property_Model.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     images = json['images'].cast<String>();
//     fundedDate = json['funded_date'];
//     purchasePrice = json['purchase_price'];
//     funderCount = json['funder_count'];
//     rentalIncome = json['rental_income'];
//     currentRent = json['current_rent'];
//     percent = json['percent'];
//     locationString = json['location_string'];
//     propertyPriceTotal = json['property_price_total'];
//     propertyPrice = json['property_price'];
//     currentEvaluation = json['current_evaluation'];
//     discount = json['discount'];
//     estimatedAnnualisedReturn = json['estimated_annualised_return'];
//     estimatedAnnualAppreciation = json['estimated_annual_appreciation'];
//     estimatedProjectedGrossYield = json['estimated_projected_gross_yield'];
//     serviceCharge = json['service_charge'];
//     status = json['status'];
//     approved = json['approved']; // Assign approved field
//     categoryId = json['category_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = id;
//     data['name'] = name;
//     data['description'] = description;
//     data['images'] = images;
//     data['funded_date'] = fundedDate;
//     data['purchase_price'] = purchasePrice;
//     data['funder_count'] = funderCount;
//     data['rental_income'] = rentalIncome;
//     data['current_rent'] = currentRent;
//     data['percent'] = percent;
//     data['location_string'] = locationString;
//     data['property_price_total'] = propertyPriceTotal;
//     data['property_price'] = propertyPrice;
//     data['current_evaluation'] = currentEvaluation;
//     data['discount'] = discount;
//     data['estimated_annualised_return'] = estimatedAnnualisedReturn;
//     data['estimated_annual_appreciation'] = estimatedAnnualAppreciation;
//     data['estimated_projected_gross_yield'] = estimatedProjectedGrossYield;
//     data['service_charge'] = serviceCharge;
//     data['status'] = status;
//     data['approved'] = approved; // Include approved field in toJson
//     data['category_id'] = categoryId;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
