import 'package:flutter/material.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/data/home/propertmodel.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class my_Property extends StatelessWidget {
  my_Property({
    super.key,
    this.imageUrl,
    this.price,
    this.rent,
    this.title,
    this.id,
    this.pending,
    this.property,
  });
  String? title;
  String? imageUrl;
  String? price;
  String? rent;
  int? id;
  bool? pending;
  Property_Model? property;

  // ==
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
  String? currentEvaluation;
  String? discount;
  String? estimatedAnnualisedReturn;
  String? estimatedAnnualAppreciation;
  String? estimatedProjectedGrossYield;
  int? serviceCharge;
  String? status;
  String? approved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pending!
          ? Get.toNamed(Routes.PROPERTY_DETAILS, arguments: {"propertyId": id})
          : Get.toNamed(Routes.MY_PROPERTY_DETAILS,
              arguments: {"my_propery_id": id}),
      child: Container(
        width: double.infinity,
        height: 97,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: const Border(
                bottom: BorderSide(
                    width: 1.5, color: Color.fromRGBO(242, 243, 234, 1)))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 82,
                height: 97,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("${ApiUrls.URl}/storage/$imageUrl")),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: (MediaQuery.of(context).size.width - 10) * 0.3,
                      child: Text(
                        softWrap: true,
                        title!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: "Lato",
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )),
                  CustomText(
                    text: "$price EGP",
                    size: 10,
                    weight: FontWeight.w600,
                  ),
                  CustomText(
                    text: "Rent earned : $rent EGP",
                    size: 12,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
