import 'package:flutter/material.dart';
import 'package:projectx/app/app_color.dart';

class SignIn extends StatefulWidget {
  static const String route = '/signin';
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      child: SafeArea(
          child: Column(
        children: [
          Row(
            children: const [
              Icon(
                Icons.arrow_back,
                color: AppColor.blackColor,
              )
            ],
          )
        ],
      )),
    );
  }
}
