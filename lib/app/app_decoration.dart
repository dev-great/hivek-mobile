import 'package:flutter/material.dart';
import 'package:projectx/app/app_color.dart';

const bodyTextStyle = TextStyle(
  fontSize: 14,
  fontFamily: 'Poppins',
  color: AppColor.textColor,
  fontWeight: FontWeight.normal,
);

const headerTextStyle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 40,
  fontWeight: FontWeight.w500,
);

const subHeaderTextStyle = TextStyle(
  fontFamily: 'Poppins',
  fontSize: 18,
  color: AppColor.textColor,
  fontWeight: FontWeight.w500,
);

InputDecoration kInputDecoration = const InputDecoration(
  isDense: true,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
    borderSide: BorderSide(
      color: AppColor.primaryColor,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
    borderSide: BorderSide(
      color: AppColor.primaryColor,
      width: 1.5,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: AppColor.dangerColor,
      width: 1.5,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: AppColor.dangerColor,
      width: 1.5,
    ),
  ),
);
