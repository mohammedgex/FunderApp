import 'package:funder_app/app/data/home/propertmodel.dart';

class myInvestment_model {
  List<Property_Model>? properties;
  List<Property_Model>? propertiesPanding;

  myInvestment_model({this.properties, this.propertiesPanding});

  myInvestment_model.fromJson(Map<String, dynamic> json) {
    if (json['properties'] != null) {
      properties = <Property_Model>[];
      json['properties'].forEach((v) {
        properties!.add(new Property_Model.fromJson(v));
      });
    }
    if (json['properties_panding'] != null) {
      propertiesPanding = <Property_Model>[];
      json['properties_panding'].forEach((v) {
        propertiesPanding!.add(new Property_Model.fromJson(v));
      });
    }
  }
}
