import 'package:flutter/material.dart';

class receiptTextField extends StatelessWidget {
  receiptTextField({super.key, this.hintText});
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: const Border(
              bottom: BorderSide(
                  width: 1, color: Color.fromRGBO(242, 243, 234, 1)))),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.red),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.red),
            ),
            errorStyle: const TextStyle(fontSize: 10, color: Colors.red),
            hintText: hintText,
            hintStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
