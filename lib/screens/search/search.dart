import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:projectx/app/app_button.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_inputtext.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/screens/auth_screen/acknowledgement.dart';

class SearchScreen extends StatefulWidget {
  static const String route = '/search';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final categories = [
    'Education',
    'Research',
    'I.C.T',
    'Politics',
    'Music',
    'Environmental',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: AppColor.textColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                  hintText: AppStrings.search,
                  inputType: TextInputType.none,
                  color: AppColor.textColor,
                  prefix: Icon(
                    FeatherIcons.search,
                    color: AppColor.textColor,
                  ),
                  suffix: GestureDetector(
                      onTap: () {
                        _filterlBottomSheet(context);
                      },
                      child: Icon(Iconsax.filter, color: AppColor.textColor)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  AppStrings.recentSearch,
                  style: headerTextStyle.copyWith(
                      fontSize: 14,
                      color: AppColor.greyColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                          leading: const Icon(
                            Icons.history,
                            color: AppColor.greyColor,
                          ),
                          title: Text(
                            'Pancake milling System',
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: bodyTextStyle.copyWith(
                              fontSize: 15,
                              color: AppColor.textColor,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.close,
                            color: AppColor.greyColor,
                          )),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                          leading: const Icon(
                            Icons.history,
                            color: AppColor.greyColor,
                          ),
                          title: Text(
                            'Design and Implementation of . . .',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: bodyTextStyle.copyWith(
                              fontSize: 15,
                              color: AppColor.textColor,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.close,
                            color: AppColor.greyColor,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _filterlBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (BuildContext bc) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: SizedBox(
                height: 540,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.searchFilter,
                      style: headerTextStyle.copyWith(
                          fontSize: 25,
                          color: AppColor.blackColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      AppStrings.projectType,
                      style: bodyTextStyle.copyWith(
                          fontSize: 18,
                          color: AppColor.blackColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal),
                    ),
                    Wrap(
                      children: List.generate(
                        categories.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: AppColor.greyColor1,
                                      ),
                                      color: AppColor.greyColor1),
                                  child: Flexible(
                                    child: Center(
                                      child: Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            categories[index],
                                            style: bodyTextStyle.copyWith(
                                              color: AppColor.greyColor,
                                              fontSize: 12,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const MyTextField(
                      hintText: AppStrings.oneTimePassword1,
                      inputType: TextInputType.name,
                      textColor: AppColor.greyColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: PrimaryBtn(
                        title: AppStrings.verifyPhone,
                        onPress: () {
                          Navigator.pop(context);
                        },
                        color: AppColor.blackColor,
                        textColor: AppColor.whiteColor,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
                        const TextSpan(text: " "),
                        TextSpan(
                          text: AppStrings.termsOfService,
                          style: bodyTextStyle.copyWith(
                              color: AppColor.textColor.withOpacity(0.5),
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500),
                        ),
                        const TextSpan(text: " "),
                        TextSpan(
                          text: AppStrings.and,
                          style: bodyTextStyle.copyWith(
                              color: AppColor.textColor.withOpacity(0.5),
                              fontSize: 15,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal),
                        ),
                        const TextSpan(text: " "),
                        TextSpan(
                          text: AppStrings.privacyPolicy,
                          style: bodyTextStyle.copyWith(
                              color: AppColor.textColor.withOpacity(0.5),
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
