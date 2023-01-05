import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_image.dart';
import 'package:projectx/app/app_string.dart';

class DashboardScreen extends StatefulWidget {
  static const String route = '/dashboard';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final categories = [
    'Environmental',
    'Education',
    'Research',
    'I.C.T',
    'Politics',
    'Music',
  ];
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: SafeArea(
            child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1.8,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 38,
                  backgroundColor: AppColor.blackColor,
                  child: CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1612720779828-8ba209f069ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTM4fHxzdWl0ZSUyMGJsYWNrbWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppStrings.hiAbdull,
                  style: headerTextStyle.copyWith(
                    color: AppColor.greyColor,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  AppStrings.letsExplore,
                  style: headerTextStyle.copyWith(
                    color: AppColor.blackColor,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (_, index) {
                          return Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                right: 10,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = index;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: selectedCategory == index
                                            ? AppColor.blackColor
                                            : AppColor.greyColor1,
                                      ),
                                      color: AppColor.greyColor1),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8, right: 15, left: 15),
                                    child: Center(
                                      child: Text(
                                        categories[index],
                                        style: bodyTextStyle.copyWith(
                                          color: selectedCategory == index
                                              ? AppColor.blackColor
                                              : AppColor.greyColor,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppStrings.continueReading,
                  style: headerTextStyle.copyWith(
                    color: AppColor.greyColor,
                    fontSize: 14,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage(AppImages.bgLight),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width - 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.greyColor1),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.3,
                            child: Text(
                              AppStrings.projectA,
                              style: headerTextStyle.copyWith(
                                color: AppColor.blackColor,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColor.blackColor,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: AppColor.whiteColor,
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: AppColor.blackColor,
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow_outlined,
                                    color: AppColor.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppStrings.projects,
                  style: headerTextStyle.copyWith(
                    color: AppColor.greyColor,
                    fontSize: 14,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.9),
                    children: List<Widget>.generate(
                      10,
                      (index) {
                        return GridTile(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                      image: AssetImage(AppImages.bgLight),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  AppStrings.projectA,
                                  style: headerTextStyle.copyWith(
                                    color: AppColor.blackColor,
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.seeMore,
                      style: headerTextStyle.copyWith(
                        color: AppColor.greyColor,
                        fontSize: 14,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
