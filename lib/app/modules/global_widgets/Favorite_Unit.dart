import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:funder_app/app/modules/home/navigated_screens/favorite_Screen/controllers/favorite_screen_controller.dart';
import 'package:funder_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class FavoriteUnit extends StatelessWidget {
  const FavoriteUnit(
      {super.key,
      this.image_url,
      this.id,
      this.propert_Location,
      this.propert_Price,
      this.status,
      this.propert_Title});

  final String? propert_Title;
  final String? propert_Location;
  final String? propert_Price;
  final String? image_url;
  final String? status;
  final int? id;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteScreenController());
    return Container(
      width: double.infinity,
      height: 113,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(171, 171, 171, 0.08),
                blurRadius: 24,
                offset: Offset(0, 4),
                spreadRadius: 0)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 102,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${ApiUrls.URl}/storage/$image_url"))),
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 10) * 0.4,
                  child: Text(
                    softWrap: true,
                    propert_Title!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontFamily: "Lato",
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                CustomText(
                  text: "$propert_Price EGP",
                  weight: FontWeight.w600,
                  size: 14,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/location.svg"),
                    const SizedBox(
                      width: 4,
                    ),
                    SizedBox(
                      width: 150,
                      child: CustomText(
                        text: "$propert_Location",
                        ellipsis: true,
                        weight: FontWeight.w400,
                        size: 10,
                      ),
                    )
                  ],
                ),
                Container(
                  width: 59,
                  height: 21,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(4, 54, 61, 0.7),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: CustomText(
                      text: "$status",
                      size: 10,
                      weight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.removetofavorite(
                id!,
              );
              AnimatedSnackBar.material(
                'The item has been removed successfully',
                duration: const Duration(seconds: 3),
                mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                type: AnimatedSnackBarType.warning,
              ).show(
                context,
              );
              Get.offAllNamed(Routes.MAIN_PAGE);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset("assets/icons/favor.svg"),
            ),
          )
        ],
      ),
    );
  }
}
