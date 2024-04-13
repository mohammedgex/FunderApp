import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

class FavoriteUnit extends StatelessWidget {
  const FavoriteUnit(
      {super.key,
      this.image_url,
      this.propert_Location,
      this.propert_Price,
      this.propert_Title});

  final String? propert_Title;
  final String? propert_Location;
  final String? propert_Price;
  final String? image_url;

  @override
  Widget build(BuildContext context) {
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
                    image: NetworkImage(
                        "https://5e22-156-196-105-117.ngrok-free.app/uploads/$image_url"))),
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "$propert_Title",
                  weight: FontWeight.w500,
                  size: 14,
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
                    Container(
                      width: 150,
                      child: CustomText(
                        text: "$propert_Location",
                        ellipsis: true,
                        weight: FontWeight.w400,
                        size: 10,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset("assets/icons/favor.svg"),
          )
        ],
      ),
    );
  }
}
