import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:projectx/app/app_button.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_image.dart';
import 'package:projectx/app/app_inputtext.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/screens/dashboard/read_file.dart';

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
  double startYear = 2010, endYear = 2014;
  // void _yearRangeSearch(start, end) {
  //   setState(() {
  //     startYear = start;
  //     endYear = end;
  //   });
  // }

  bool searchResult = false;
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
                  children: const [
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
                  prefix: GestureDetector(
                    onTap: () {
                      setState(() {
                        searchResult = !searchResult;
                      });
                    },
                    child: const Icon(
                      FeatherIcons.search,
                      color: AppColor.textColor,
                    ),
                  ),
                  suffix: GestureDetector(
                      onTap: () {
                        _filterlBottomSheet(context);
                      },
                      child: const Icon(Iconsax.filter,
                          color: AppColor.textColor)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  searchResult == true
                      ? AppStrings.searchResult
                      : AppStrings.recentSearch,
                  style: headerTextStyle.copyWith(
                      fontSize: 14,
                      color: AppColor.greyColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                ),
                searchResult == true
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: GridView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.9),
                                children: List<Widget>.generate(
                                  10,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, ReadFile.route);
                                      },
                                      child: GridTile(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 120,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  image: const DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.bgLight),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                AppStrings.projectA,
                                                style: headerTextStyle.copyWith(
                                                  color: AppColor.blackColor,
                                                  fontSize: 14,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      FeatherIcons.chevronLeft,
                                      color: AppColor.greyColor,
                                    ),
                                    Text(
                                      AppStrings.previous,
                                      style: headerTextStyle.copyWith(
                                        color: AppColor.greyColor,
                                        fontSize: 14,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      AppStrings.next,
                                      style: headerTextStyle.copyWith(
                                        color: AppColor.greyColor,
                                        fontSize: 14,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    const Icon(
                                      FeatherIcons.chevronRight,
                                      color: AppColor.greyColor,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    : Column(
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

  final projectTypeList = [];

  void _filterlBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (BuildContext bc) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter state) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
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
                          fontSize: 15,
                          color: AppColor.blackColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500),
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
                                GestureDetector(
                                  onTap: () {
                                    state(() {
                                      projectTypeList.add(index);
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: projectTypeList.contains(index)
                                              ? AppColor.blackColor
                                              : AppColor.greyColor1,
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      AppStrings.yearRange,
                      style: bodyTextStyle.copyWith(
                          fontSize: 15,
                          color: AppColor.blackColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: RangeSlider(
                          min: 2000,
                          max: 2023,
                          divisions: 100, //slide interval
                          activeColor: AppColor.blackColor,
                          inactiveColor: AppColor.greyColor,
                          labels: RangeLabels(
                              "${startYear.toInt()}", "${endYear.toInt()}"),
                          values: RangeValues(startYear, endYear),
                          onChanged: (RangeValues value) {
                            state(() {
                              startYear = value.start;
                              endYear = value.end;
                            });
                            // _yearRangeSearch(value.start, value.end);
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            color: AppColor.greyColor1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(children: [
                                TextSpan(
                                  text: "Start:",
                                  style: bodyTextStyle.copyWith(
                                      color:
                                          AppColor.textColor.withOpacity(0.5),
                                      fontSize: 14,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(text: "  "),
                                TextSpan(
                                  text: "${startYear.toInt()}",
                                  style: bodyTextStyle.copyWith(
                                      color:
                                          AppColor.textColor.withOpacity(0.5),
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            color: AppColor.greyColor1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(children: [
                                TextSpan(
                                  text: "End:",
                                  style: bodyTextStyle.copyWith(
                                      color:
                                          AppColor.textColor.withOpacity(0.5),
                                      fontSize: 14,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(text: "  "),
                                TextSpan(
                                  text: "${endYear.toInt()} ",
                                  style: bodyTextStyle.copyWith(
                                      color:
                                          AppColor.textColor.withOpacity(0.5),
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: PrimaryBtn(
                        title: AppStrings.verifyPhone,
                        onPress: () {
                          projectTypeList.clear();
                          Navigator.pop(context);
                        },
                        color: AppColor.blackColor,
                        textColor: AppColor.whiteColor,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                      ],
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
