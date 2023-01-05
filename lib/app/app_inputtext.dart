import 'package:flutter/material.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.hintText,
    required this.inputType,
    this.textColor,
    this.color,
    this.prefix,
    this.suffix,
  }) : super(key: key);
  final String hintText;
  final Widget? prefix;
  final Widget? suffix;
  final Color? color;
  final Color? textColor;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        style: bodyTextStyle.copyWith(color: AppColor.textColor),
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: hintText,
          hintStyle:
              bodyTextStyle.copyWith(color: textColor ?? AppColor.greyColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: color ?? AppColor.textColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.textColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
