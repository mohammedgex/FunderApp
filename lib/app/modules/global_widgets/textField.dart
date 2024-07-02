import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          hintStyle: const TextStyle(
              fontFamily: "Lato",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(4, 54, 61, 1)),
          hintText: hinttext,
          disabledBorder: null,
          prefixIcon: icon,
          border: InputBorder.none,
          suffix: suficon,
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
              ? OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    width: border_width!,
                  ))
              : null,
          enabledBorder: showborder
              ? OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: border_width!))
              : null),
    );
  }
}
