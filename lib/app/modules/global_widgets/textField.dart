import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String? hinttext;
  Widget? icon;
  Widget? suficon;
  bool? showen;
  TextInputType? keyboard;
  TextEditingController? controller;
  int? max;
  int? Lines;
  double? width;
  double? textFieldheight;
  bool? readonly;
  Decoration? decoration;
  bool showborder;
  double? border_width;
  String? Function(String?)? validation;
  // Function(String)? onchange;

  CustomTextField(
      {super.key,
      this.hinttext,
      this.icon,
      this.suficon,
      this.validation,
      this.width = 350,
      this.showen = false,
      this.keyboard,
      this.controller,
      this.max,
      this.border_width = 1,
      this.Lines = 1,
      this.decoration,
      this.showborder = true,
      this.textFieldheight = 48,
      this.readonly = false});

  @override
  Widget build(BuildContext context) {
    String fontFamily =
        Get.locale?.languageCode == 'ar' ? 'Tajawal-Regular' : 'Lato';
    return TextFormField(
      validator: validation,
      readOnly: readonly!,

      // onChanged: onchange!,
      maxLength: max,
      maxLines: Lines,
      controller: controller,
      obscureText: showen!,
      keyboardType: keyboard,
      autovalidateMode: AutovalidateMode.disabled,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        
          hintStyle: TextStyle(
              fontFamily: fontFamily,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(4, 54, 61, 1)),
          hintText: hinttext,
          disabledBorder: null,
          prefixIcon: icon,
          border: InputBorder.none,
          suffixIcon: suficon,
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: border_width!, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: border_width!, color: Colors.red),
          ),
          errorStyle: const TextStyle(fontSize: 10, color: Colors.red),
          focusedBorder: showborder
              ? const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      width: 1.5, color: Color.fromRGBO(236, 138, 35, 1)))
              : null,
          enabledBorder: showborder
              ? OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: border_width!))
              : null),
    );
  }
}
