import 'package:flutter/material.dart';
import 'package:funder_app/app/data/apis_url.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

class receiptUnit extends StatelessWidget {
  String? imageUrl;
  String? amount;
  String? date;
  String? status;
  receiptUnit({super.key, this.amount, this.date, this.imageUrl, this.status});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 74,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Image
          Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${ApiUrls.URl}/uploads/$imageUrl")),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 0.5, color: const Color.fromRGBO(115, 115, 115, 1))),
          ),
          // Texts
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Date $date",
                size: 16,
                weight: FontWeight.w400,
                color: const Color.fromRGBO(4, 54, 61, 1),
              ),
              CustomText(
                text: "$amount EGP",
                size: 16,
                weight: FontWeight.w400,
                color: const Color.fromRGBO(4, 54, 61, 1),
              ),
              CustomText(
                text: "$status",
                size: 14,
                weight: FontWeight.w400,
                color: const Color.fromRGBO(53, 169, 58, 1),
              ),
            ],
          )
        ],
      ),
    );
  }
}
