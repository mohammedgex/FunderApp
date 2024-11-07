import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/home/navigated_screens/home_Screen/controllers/home_screen_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class PropertiyUnit extends StatelessWidget {
  const PropertiyUnit(
      {super.key,
      this.propert_Location,
      this.image_url,
      this.propert_Price,
      this.id,
      this.approved,
      this.currentRent,
      this.description,
      this.fundedDate,
      this.funderCount,
      this.locationString,
      this.percent,
      this.propertyPrice,
      this.propertyPriceTotal,
      this.purchasePrice,
      this.rentalIncome,
      this.serviceCharge,
      this.images,
      this.status,
      this.transactionCosts,
      this.controller,
      this.isFavorite,
      this.propert_Title});
  final String? propert_Title;
  final String? propert_Location;
  final String? propert_Price;
  final String? image_url;
  final HomeScreenController? controller;
  final int? id;
  final String? description;
  final String? fundedDate;
  final int? purchasePrice;
  final int? funderCount;
  final int? rentalIncome;
  final int? currentRent;
  final int? percent;
  final String? locationString;
  final int? propertyPriceTotal;
  final String? propertyPrice;
  final int? transactionCosts;
  final int? serviceCharge;
  final dynamic status;
  final dynamic approved;
  final List<dynamic>? images;
  final String? isFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.PROPERTY_DETAILS,
          arguments: {
            "propertyId": id,
            "isFavorite": isFavorite,
            "backMain": true
          },
        );
      },
      child: Container(
        width: 350,
        height: 264,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(171, 171, 171, 0.08),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 0)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          NetworkImage("${ApiUrls.URl}/storage/$image_url"))),
              height: 173,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: (MediaQuery.of(context).size.width - 10) * 0.6,
                      child: Text(
                        softWrap: true,
                        propert_Title!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: "Lato",
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )
                      //  CustomText(
                      //   text: "$propert_Title",
                      //   ellipsis: true,
                      //   weight: FontWeight.w500,
                      //   size: 14,
                      // ),
                      ),
                  InkWell(
                      onTap: () async {
                        if (isFavorite == "true") {
                          await controller!.removetofavorite(id!);
                          Get.offAllNamed(Routes.MAIN_PAGE);
                        } else if (isFavorite == "false") {
                          await controller!.addtofavorite(id!, context);
                          Get.offAllNamed(Routes.MAIN_PAGE);
                        }
                      },
                      child: isFavorite == "true"
                          ? const Icon(
                              IconlyBold.heart,
                              color: Color.fromRGBO(236, 138, 35, 1),
                            )
                          : const Icon(
                              IconlyLight.heart,
                              color: Color.fromARGB(255, 46, 44, 44),
                            ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: CustomText(
                text:
                    "${NumberFormat('#,###').format(int.parse(propert_Price!))} EGP",
                weight: FontWeight.w600,
                size: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/location.svg"),
                  const SizedBox(
                    width: 4,
                  ),
                  CustomText(
                    text: "$propert_Location",
                    ellipsis: true,
                    weight: FontWeight.w400,
                    size: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
