import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectx/app/app_button.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/screens/auth_screen/tell_more.dart';

class EmailValidation extends StatefulWidget {
  static const String route = '/email_validation';
  const EmailValidation({super.key});

  @override
  State<EmailValidation> createState() => _EmailValidationState();
}

class _EmailValidationState extends State<EmailValidation> {
  bool _isActive = false;
  TextEditingController otpController = TextEditingController();

  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: AppColor.blackColor),
          ),
          elevation: 0,
          backgroundColor: AppColor.whiteColor),
      body: Container(
        color: AppColor.whiteColor,
        child: SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text(
                      AppStrings.enterOTP,
                      style: headerTextStyle.copyWith(
                          fontSize: 40,
                          color: AppColor.blackColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    AppStrings.enterOTPText,
                    style: subHeaderTextStyle.copyWith(
                        fontSize: 18,
                        color: AppColor.blackColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: _form,
                child: TextFormField(
                  controller: otpController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: bodyTextStyle.copyWith(
                      fontSize: 15, color: AppColor.blackColor),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  maxLength: 6,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColor.textColor),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColor.textColor),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    fillColor: AppColor.blackColor,
                    hintText: AppStrings.oneTimePassword,
                    hintStyle: bodyTextStyle.copyWith(
                      fontSize: 15,
                      color: AppColor.textColor.withOpacity(0.3),
                    ),
                  ),
                  onChanged: (v) {
                    if (v.length == 6) {
                      setState(() {
                        _isActive = true;
                      });
                    } else {
                      setState(() {
                        _isActive = false;
                      });
                    }
                  },
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Enter Your Code';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryBtn(
                title: AppStrings.verifyEmail,
                onPress: () {
                  _isActive == true
                      ? Navigator.pushNamed(context, TellMore.route)
                      : () {};
                },
                color: _isActive == true
                    ? AppColor.blackColor
                    : AppColor.greyColor,
                textColor: _isActive == true
                    ? AppColor.whiteColor
                    : AppColor.textColor.withOpacity(0.3),
              ),
              const SizedBox(
                height: 25,
              ),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(children: [
                  TextSpan(
                    text: AppStrings.emailVerifyText,
                    style: bodyTextStyle.copyWith(
                        color: AppColor.textColor.withOpacity(0.5),
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal),
                  ),
                  TextSpan(text: " "),
                  TextSpan(
                    text: AppStrings.termsOfService,
                    style: bodyTextStyle.copyWith(
                        color: AppColor.textColor.withOpacity(0.5),
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(text: " "),
                  TextSpan(
                    text: AppStrings.and,
                    style: bodyTextStyle.copyWith(
                        color: AppColor.textColor.withOpacity(0.5),
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal),
                  ),
                  TextSpan(text: " "),
                  TextSpan(
                    text: AppStrings.privacyPolicy,
                    style: bodyTextStyle.copyWith(
                        color: AppColor.textColor.withOpacity(0.5),
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500),
                  ),
                ]),
              )
            ],
          ),
        )),
      ),
    );
  }
}
