import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/modules/global_widgets/button.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

class FavoriteUnit extends StatelessWidget {
  const FavoriteUnit(
      {super.key,
      this.image_url,
      this.propert_Location,
      this.propert_Price,
      this.status,
      this.propert_Title});

  final String? propert_Title;
  final String? propert_Location;
  final String? propert_Price;
  final String? image_url;
  final String? status;

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
                    image: NetworkImage("${ApiUrls.URl}/uploads/$image_url"))),
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset("assets/icons/favor.svg"),
          )
        ],
      ),
    );
  }
}