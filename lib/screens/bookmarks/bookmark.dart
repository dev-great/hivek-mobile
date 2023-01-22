import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:projectx/app/app_button.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_image.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/screens/dashboard/read_file.dart';

class BookmarkScreen extends StatefulWidget {
  static const String route = '/bookmark';
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  final ExpandableController? controllerFirst =
      ExpandableController(initialExpanded: true);
  bool isEmpty = true;
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
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColor.textColor,
                      child: Positioned(
                        top: 20,
                        left: 20,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1612720779828-8ba209f069ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTM4fHxzdWl0ZSUyMGJsYWNrbWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isEmpty = !isEmpty;
                        });
                      },
                      child: Text(
                        AppStrings.bookmarks,
                        style: headerTextStyle.copyWith(
                            fontSize: 18,
                            color: AppColor.textColor,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                isEmpty == true
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 6,
                          ),
                          Center(
                            child: Image.asset(AppImages.empty),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PrimaryBtn(
                            title: AppStrings.viewPorjects,
                            onPress: () {},
                            color: AppColor.blackColor,
                          )
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExpandablePanel(
                            controller: controllerFirst,
                            theme: const ExpandableThemeData(
                              iconColor: AppColor.textColor,
                              expandIcon: Iconsax.arrow_circle_up,
                              collapseIcon: Iconsax.arrow_circle_down,
                            ),
                            header: Text(AppStrings.chapter,
                                style: headerTextStyle.copyWith(
                                    color: AppColor.textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            collapsed: const Text(''),
                            expanded: Expanded(
                              child: GridView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.9),
                                children: List<Widget>.generate(
                                  2,
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
                                                  color: AppColor.textColor,
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
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ExpandablePanel(
                            theme: const ExpandableThemeData(
                              iconColor: AppColor.textColor,
                              expandIcon: Iconsax.arrow_circle_up,
                              collapseIcon: Iconsax.arrow_circle_down,
                            ),
                            header: Text(AppStrings.literatureReview,
                                style: headerTextStyle.copyWith(
                                    color: AppColor.textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            collapsed: const Text(''),
                            expanded: Expanded(
                              child: GridView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.9),
                                children: List<Widget>.generate(
                                  2,
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
                                                  color: AppColor.textColor,
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
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ExpandablePanel(
                            theme: const ExpandableThemeData(
                              iconColor: AppColor.textColor,
                              expandIcon: Iconsax.arrow_circle_up,
                              collapseIcon: Iconsax.arrow_circle_down,
                            ),
                            header: Text(AppStrings.requirements,
                                style: headerTextStyle.copyWith(
                                    color: AppColor.textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            collapsed: const Text(''),
                            expanded: Expanded(
                              child: GridView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.9),
                                children: List<Widget>.generate(
                                  2,
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
                                                  color: AppColor.textColor,
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
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ExpandablePanel(
                            theme: const ExpandableThemeData(
                              iconColor: AppColor.textColor,
                              expandIcon: Iconsax.arrow_circle_up,
                              collapseIcon: Iconsax.arrow_circle_down,
                            ),
                            header: Text(AppStrings.caseStudies,
                                style: headerTextStyle.copyWith(
                                    color: AppColor.textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            collapsed: const Text(''),
                            expanded: Expanded(
                              child: GridView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.9),
                                children: List<Widget>.generate(
                                  2,
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
                                                  color: AppColor.textColor,
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
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
