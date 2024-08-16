import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funder_app/app/modules/global_widgets/text.dart';

class copy_Box extends StatelessWidget {
  const copy_Box({super.key, this.content, this.title});
  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          border: const Border(
            bottom:
                BorderSide(width: 1, color: Color.fromRGBO(242, 243, 234, 1)),
          ),
          borderRadius: BorderRadius.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                size: 16,
                ellipsis: true,
                weight: FontWeight.w500,
                color: const Color.fromRGBO(177, 174, 174, 1),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  "$content",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: content!));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Copied to clipboard: $content')),
                );
              },
              child: SvgPicture.asset("assets/copy.svg"))
        ],
      ),
    );
  }
}
