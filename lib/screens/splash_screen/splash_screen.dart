import 'package:flutter/material.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_image.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/screens/welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _splash();
  }

  _splash() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {
      Navigator.pushNamed(context, WelcomeScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: AppColor.whiteColor,
        ),
        duration: const Duration(milliseconds: 4500000),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.appName,
                  style: headerTextStyle.copyWith(
                      fontSize: 45,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.broughtToYou,
                    style: subHeaderTextStyle.copyWith(
                        color: AppColor.greyColor,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    AppStrings.comSicMx,
                    style: subHeaderTextStyle.copyWith(
                      color: AppColor.greyColor,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
