import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final bool isPasswordField;

  const InputField(
      {super.key,
      required this.hint,
      required this.iconData,
      this.isPasswordField = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 32.w),
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
            filled: true,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            fillColor: Colors.white,
            hintText: hint,
            prefixIcon: Icon(iconData),
            suffixIcon: isPasswordField ? Icon(Icons.visibility_off) : null),
      ),
    );
  }
}
