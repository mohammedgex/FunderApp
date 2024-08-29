import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';
import 'package:timeline_tile/timeline_tile.dart';

class PropertyTimeLineTile extends StatelessWidget {
  const PropertyTimeLineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.DateTitle,
    required this.DateText,
    required this.DateDetails,
    required this.isPayRents,
  });

  final bool isFirst;
  final bool isLast;
  final String DateText;
  final String DateTitle;
  final bool? isPayRents;

  final String DateDetails;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isPayRents! ? 70 : 150,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        endChild: Container(
          height: 110,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isPayRents!
                  ? const SizedBox()
                  : CustomText(
                      text: DateText,
                      size: 14,
                    ),
              CustomText(
                text: DateTitle,
                size: 16,
                weight: FontWeight.w600,
              ),
              isPayRents!
                  ? const SizedBox()
                  : CustomText(
                      size: 12,
                      weight: FontWeight.w400,
                      text: DateDetails,
                    ),
            ],
          ),
        ),
        indicatorStyle: IndicatorStyle(
            indicator: isFirst
                ? SvgPicture.asset("assets/icons/tileIcon.svg")
                : SvgPicture.asset("assets/icons/tilegray.svg"),
            color: isFirst
                ? const Color.fromRGBO(4, 54, 61, 1)
                : const Color.fromRGBO(217, 217, 217, 1)),
        beforeLineStyle: const LineStyle(
            thickness: 1, color: Color.fromRGBO(217, 217, 217, 1)),
      ),
    );
  }
}
