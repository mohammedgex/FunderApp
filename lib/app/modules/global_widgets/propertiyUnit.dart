import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/home/navigated_screens/home_Screen/controllers/home_screen_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class PropertiyUnit extends StatelessWidget {
  PropertiyUnit(
      {super.key,
      this.propert_Location,
      this.image_url,
      this.propert_Price,
      this.id,
      this.controller,
      this.propert_Title});
  final String? propert_Title;
  final String? propert_Location;
  final String? propert_Price;
  final String? image_url;
  final HomeScreenController? controller;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.PROPERTY_DETAILS),
      child: Container(
        width: 300,
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
                          NetworkImage("${ApiUrls.URl}/uploads/$image_url"))),
              height: 173,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "$propert_Title",
                    weight: FontWeight.w500,
                    size: 14,
                  ),
                  InkWell(
                      onTap: () async {
                        await controller!.addtofavorite(id!);
                      },
                      child: SvgPicture.asset("assets/icons/favorite2.svg"))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: CustomText(
                text: "$propert_Price EGP",
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
