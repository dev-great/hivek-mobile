import 'package:flutter/material.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_image.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/screens/base.dart';

class Acknowledgement extends StatefulWidget {
  static const String route = '/acknowledgement';
  const Acknowledgement({super.key});

  @override
  State<Acknowledgement> createState() => _AcknowledgementState();
}

class _AcknowledgementState extends State<Acknowledgement> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: AppColor.whiteColor,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage(AppImages.bgLight),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              arg['isSettings'] == false
                                  ? Navigator.pushNamed(
                                      context, BaseScreen.route)
                                  : Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Icon(
                                Icons.close,
                                color: AppColor.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(child: Image.asset(AppImages.logoWhite)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          AppStrings.acknowledgement,
                          style: bodyTextStyle.copyWith(
                            color: AppColor.primaryColor,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const CircleAvatar(
                              radius: 38,
                              backgroundColor: AppColor.blackColor,
                              child: CircleAvatar(
                                radius: 36,
                                backgroundColor: AppColor.whiteColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                AppStrings.guma,
                                style: bodyTextStyle.copyWith(
                                  color: AppColor.blackColor,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const CircleAvatar(
                              radius: 38,
                              backgroundColor: AppColor.blackColor,
                              child: CircleAvatar(
                                radius: 36,
                                backgroundColor: AppColor.whiteColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                AppStrings.abdull,
                                style: bodyTextStyle.copyWith(
                                  color: AppColor.blackColor,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const CircleAvatar(
                              radius: 38,
                              backgroundColor: AppColor.blackColor,
                              child: CircleAvatar(
                                radius: 36,
                                backgroundColor: AppColor.whiteColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                AppStrings.great,
                                style: bodyTextStyle.copyWith(
                                  color: AppColor.blackColor,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const CircleAvatar(
                              radius: 38,
                              backgroundColor: AppColor.blackColor,
                              child: CircleAvatar(
                                radius: 36,
                                backgroundColor: AppColor.whiteColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                AppStrings.joe,
                                style: bodyTextStyle.copyWith(
                                  color: AppColor.blackColor,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 80,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Text(
                            AppStrings.thisApp,
                            style: bodyTextStyle.copyWith(
                              color: AppColor.blackColor,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          AppStrings.supervisedBy,
                          style: bodyTextStyle.copyWith(
                            color: AppColor.primaryColor,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            const CircleAvatar(
                              radius: 38,
                              backgroundColor: AppColor.blackColor,
                              child: CircleAvatar(
                                radius: 36,
                                backgroundColor: AppColor.whiteColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                AppStrings.eFAminu,
                                style: bodyTextStyle.copyWith(
                                  color: AppColor.blackColor,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          children: [
                            const CircleAvatar(
                              radius: 38,
                              backgroundColor: AppColor.blackColor,
                              child: CircleAvatar(
                                radius: 36,
                                backgroundColor: AppColor.whiteColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                AppStrings.eFAminu,
                                style: bodyTextStyle.copyWith(
                                  color: AppColor.blackColor,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
