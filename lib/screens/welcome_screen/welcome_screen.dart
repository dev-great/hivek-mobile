import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projectx/app/app_button.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_image.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/screens/auth_screen/auth_signup.dart';
import 'package:projectx/screens/base.dart';

class WelcomeScreen extends StatelessWidget {
  static const String route = '/welcome';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.bgLight),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Image.asset(AppImages.noteBook,
                        height: 255, width: 255),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45))),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height / 2.4,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 20),
                                  child: Text(
                                    AppStrings.welcomeText,
                                    style: headerTextStyle.copyWith(
                                        fontSize: 30,
                                        color: AppColor.blackColor,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                PrimaryBtn(
                                  title: AppStrings.continueWithEmail,
                                  onPress: () {
                                    Navigator.pushNamed(context, SignUp.route);
                                  },
                                  isIcon: true,
                                  icon: Icons.mail_outlined,
                                  color: AppColor.greyColor1,
                                  iconColor: AppColor.blackColor,
                                  textColor: AppColor.blackColor,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 1,
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      color: AppColor.greyColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        AppStrings.or,
                                        style: bodyTextStyle.copyWith(
                                            fontSize: 14,
                                            color: AppColor.greyColor,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      color: AppColor.greyColor,
                                    ),
                                  ],
                                ),
                                PrimaryBtn(
                                  title: AppStrings.continueWithGoogle,
                                  onPress: () {
                                    Navigator.pushNamed(
                                        context, BaseScreen.route);
                                  },
                                  isIcon: true,
                                  icon: FontAwesomeIcons.google,
                                  color: AppColor.blueColor,
                                  iconColor: AppColor.whiteColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
