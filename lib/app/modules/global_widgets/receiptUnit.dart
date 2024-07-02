import 'package:flutter/material.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

class receiptUnit extends StatelessWidget {
  String? imageUrl;
  String? amount;
  String? date;
  String? status;
  receiptUnit({super.key, this.amount, this.date, this.imageUrl, this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 74,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image
          Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://s3-alpha-sig.figma.com/img/9053/ed38/f66e17ba26992842e51e3b31fa4db17d?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LgW-LOiq2ZPc-IHMop-G2jVu~ZhAUEuYxj0KcjXlEJ~zAn8Nf1CUYt0nnaAI3--c6Br5mhPSOTtF9AwuMnZSpgsoED73ShWeL5nGsrxBTsRaF8eVmmcLylaH0Vp-ia4MEtIIMQmSKA1jxhJwQ-3nYmnCnqQGZwNFtIK5bqEP3ZV~giSxEWTcFylEwE14WJGT4DPiMyaebxX3Ur-iyOWyoo90NC31rvGaEV~WIXo1OMzJowP3SarttYiReYD4BaVtcLF~wI2ivOMqNxRcl4d4thUIkPEhj6mKdJv15cyXVi89JA3ax2MU4L8nCfnwS8AJjhZbDsqEuArZGT1Yiz-~eg__")),
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
                text: "Date 22/1/2023",
                size: 16,
                weight: FontWeight.w400,
                color: const Color.fromRGBO(4, 54, 61, 1),
              ),
              CustomText(
                text: "3000 EGP",
                size: 16,
                weight: FontWeight.w400,
                color: const Color.fromRGBO(4, 54, 61, 1),
              ),
              CustomText(
                text: "Accepted",
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
