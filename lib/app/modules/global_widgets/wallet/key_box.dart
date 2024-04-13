import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

class key_box extends StatelessWidget {
  const key_box({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 150,
      height: 87,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: const Border(
            bottom: BorderSide(width: 0.5, color: Colors.black),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/wallet_assets/income.svg"),
              Container(
                child: CustomText(
                  ellipsis: true,
                  size: 14,
                  weight: FontWeight.w500,
                  text: "Monthly income",
                  color: Color.fromRGBO(4, 54, 61, 1),
                ),
              )
            ],
          ),
          CustomText(
            text: "AED 1.99",
            size: 14,
            weight: FontWeight.w700,
            color: Color.fromRGBO(4, 54, 61, 1),
          ),
          CustomText(
            text: "NOV2023",
            color: Color.fromRGBO(4, 54, 61, 1),
            size: 10,
            weight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
