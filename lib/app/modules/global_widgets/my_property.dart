import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class my_Property extends StatelessWidget {
  const my_Property({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://www.ubm-development.com/magazin/wp-content/uploads/2020/03/kl-main-building-d-Kopie.jpg")),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "2 Bed in park Heughts",
                  size: 14,
                  weight: FontWeight.w500,
                ),
                CustomText(
                  text: "AED 9.458",
                  size: 10,
                  weight: FontWeight.w600,
                ),
                CustomText(
                  text: "Rent earned : AED 19.9",
                  size: 12,
                  weight: FontWeight.w400,
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.MY_PROPERTY_DETAILS),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
