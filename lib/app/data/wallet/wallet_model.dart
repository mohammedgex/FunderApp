class wallet_model {
  int? receipts;
  int? myInvestments;
  int? deposit;
  int? numberOfProperties;
  int? monthlyIncome;
  int? annualGrossYield;

  wallet_model(
      {this.receipts,
      this.myInvestments,
      this.deposit,
      this.numberOfProperties,
      this.monthlyIncome,
      this.annualGrossYield});

  wallet_model.fromJson(Map<String, dynamic> json) {
    receipts = json['receipts'];
    myInvestments = json['my_investments'];
    deposit = json['deposit'];
    numberOfProperties = json['number_of_properties'];
    monthlyIncome = json['monthly_income'];
    annualGrossYield = json['annual_gross_yield'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['receipts'] = receipts;
    data['my_investments'] = myInvestments;
    data['deposit'] = deposit;
    data['number_of_properties'] = numberOfProperties;
    data['monthly_income'] = monthlyIncome;
    data['annual_gross_yield'] = annualGrossYield;
    return data;
  }
}
