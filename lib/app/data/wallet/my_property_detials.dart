class PropertyDetailsModal {
  final Property property;
  final String propertyPrice;
  final String annualisedReturn;
  final String currentEvaluation;
  final int currentRent;
  final int investedAmount;
  final int investmentValue;
  final int myOwnership;
  final int totalRentReceived;
  final int theLastPayment;
  final String expectedNextPayment;

  PropertyDetailsModal({
    required this.property,
    required this.propertyPrice,
    required this.annualisedReturn,
    required this.currentEvaluation,
    required this.currentRent,
    required this.investedAmount,
    required this.investmentValue,
    required this.myOwnership,
    required this.totalRentReceived,
    required this.theLastPayment,
    required this.expectedNextPayment,
  });

  factory PropertyDetailsModal.fromJson(Map<String, dynamic> json) {
    return PropertyDetailsModal(
      property: Property.fromJson(json['property']),
      propertyPrice: json['property_price'],
      annualisedReturn: json['annualised_return'],
      currentEvaluation: json['current_evaluation'],
      currentRent: json['current_rent'],
      investedAmount: json['invested_amount'],
      investmentValue: json['investment_value'],
      myOwnership: json['my_owner_ship'],
      totalRentReceived: json['total_rent_received'],
      theLastPayment: json['the_last_payment'],
      expectedNextPayment: json['expected_next_payment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'property': property.toJson(),
      'property_price': propertyPrice,
      'annualised_return': annualisedReturn,
      'current_evaluation': currentEvaluation,
      'current_rent': currentRent,
      'invested_amount': investedAmount,
      'investment_value': investmentValue,
      'my_owner_ship': myOwnership,
      'total_rent_received': totalRentReceived,
      'the_last_payment': theLastPayment,
      'expected_next_payment': expectedNextPayment,
    };
  }
}

class Property {
  final int id;
  final String name;
  final String description;
  final List<String> images;
  final String fundedDate;
  final int purchasePrice;
  final int funderCount;
  final int rentalIncome;
  final int currentRent;
  final int percent;
  final String locationString;
  final int propertyPriceTotal;
  final String propertyPrice;
  final String discount;
  final String estimatedAnnualisedReturn;
  final String estimatedAnnualAppreciation;
  final String estimatedProjectedGrossYield;
  final int serviceCharge;
  final String status;
  final dynamic approved;
  final int categoryId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Property({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.fundedDate,
    required this.purchasePrice,
    required this.funderCount,
    required this.rentalIncome,
    required this.currentRent,
    required this.percent,
    required this.locationString,
    required this.propertyPriceTotal,
    required this.propertyPrice,
    required this.discount,
    required this.estimatedAnnualisedReturn,
    required this.estimatedAnnualAppreciation,
    required this.estimatedProjectedGrossYield,
    required this.serviceCharge,
    required this.status,
    this.approved,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images']),
      fundedDate: json['funded_date'],
      purchasePrice: json['purchase_price'],
      funderCount: json['funder_count'],
      rentalIncome: json['rental_income'],
      currentRent: json['current_rent'],
      percent: json['percent'],
      locationString: json['location_string'],
      propertyPriceTotal: json['property_price_total'],
      propertyPrice: json['property_price'],
      discount: json['discount'],
      estimatedAnnualisedReturn: json['estimated_annualised_return'],
      estimatedAnnualAppreciation: json['estimated_annual_appreciation'],
      estimatedProjectedGrossYield: json['estimated_projected_gross_yield'],
      serviceCharge: json['service_charge'],
      status: json['status'],
      approved: json['approved'],
      categoryId: json['category_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'images': images,
      'funded_date': fundedDate,
      'purchase_price': purchasePrice,
      'funder_count': funderCount,
      'rental_income': rentalIncome,
      'current_rent': currentRent,
      'percent': percent,
      'location_string': locationString,
      'property_price_total': propertyPriceTotal,
      'property_price': propertyPrice,
      'discount': discount,
      'estimated_annualised_return': estimatedAnnualisedReturn,
      'estimated_annual_appreciation': estimatedAnnualAppreciation,
      'estimated_projected_gross_yield': estimatedProjectedGrossYield,
      'service_charge': serviceCharge,
      'status': status,
      'approved': approved,
      'category_id': categoryId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
