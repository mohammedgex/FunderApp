import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

class payMethod_widget extends StatelessWidget {
  const payMethod_widget(
      {super.key, this.fees, this.payment_name, this.transfer_way});
  final String? payment_name;
  final String? fees;
  final String? transfer_way;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 102,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: const Color.fromRGBO(242, 243, 234, 1)),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: payment_name,
                size: 20,
                weight: FontWeight.w500,
              ),
              CustomText(
                text: fees,
                size: 14,
                weight: FontWeight.w400,
              ),
              CustomText(
                text: transfer_way,
                size: 13,
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
    );
  }
}
