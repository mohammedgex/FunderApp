// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPbutton extends StatelessWidget {
  OTPbutton({super.key, this.controller, this.isLast = false});
  TextEditingController? controller;
  final bool? isLast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 65,
      child: Center(
        child: TextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          textAlign: TextAlign.center,
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1) {
              if (isLast == true) {
                FocusScope.of(context).unfocus();
                print("Last");
              } else {
                FocusScope.of(context).nextFocus();
              }
            }
          },
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
          decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(4, 54, 61, 1))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                      width: 1, color: Color.fromRGBO(4, 54, 61, 1)))),
        ),
      ),
    );
  }
}
