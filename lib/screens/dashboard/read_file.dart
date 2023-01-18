import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:projectx/app/app_button.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_image.dart';
import 'package:projectx/app/app_inputtext.dart';
import 'package:projectx/app/app_string.dart';

class ReadFile extends StatefulWidget {
  static const String route = '/read-file';
  const ReadFile({super.key});

  @override
  State<ReadFile> createState() => _ReadFileState();
}

class _ReadFileState extends State<ReadFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColor.blackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    AppStrings.projectA,
                    style: headerTextStyle.copyWith(
                        fontSize: 25,
                        color: AppColor.blackColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppStrings.projectBy,
                    style: bodyTextStyle.copyWith(
                        fontSize: 14,
                        color: AppColor.textColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    AppStrings.projectDetails,
                    textAlign: TextAlign.justify,
                    style: bodyTextStyle.copyWith(
                        fontSize: 14,
                        color: AppColor.textColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 250,
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.whiteColor.withOpacity(0.5),
                    AppColor.greyColor1.withOpacity(0.9),
                    AppColor.whiteColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  tileMode: TileMode.repeated,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 3.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColor.whiteColor,
                      border: Border.all(color: AppColor.blackColor),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.bookmark_border_outlined,
                            color: AppColor.textColor,
                          ),
                          onPressed: () {
                            final name = AppStrings.bookmarks;
                            _bookModalBottomSheet(context, name);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                          ),
                          child: VerticalDivider(
                            thickness: 1,
                            color: AppColor.textColor,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Iconsax.bookmark_25,
                            color: AppColor.textColor,
                          ),
                          onPressed: () {
                            final name = AppStrings.saveMaterial;
                            _bookModalBottomSheet(context, name);
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColor.blackColor,
                      border: Border.all(color: AppColor.blackColor),
                    ),
                    child: Center(
                      child: Text(
                        AppStrings.download,
                        style: bodyTextStyle.copyWith(
                            fontSize: 14,
                            color: AppColor.whiteColor,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final Categories = [
    'Chapter 3 ',
    'Literature review',
    'Requirements',
    'Case Studies',
  ];
  void _bookModalBottomSheet(context, name) {
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
              builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              name,
                              style: headerTextStyle.copyWith(
                                  fontSize: 25,
                                  color: AppColor.blackColor,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          AppStrings.categories,
                          style: headerTextStyle.copyWith(
                              fontSize: 14,
                              color: AppColor.blackColor,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                          children: List.generate(
                              Categories.length,
                              (index) => GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 70,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListTile(
                                        leading: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                              image:
                                                  AssetImage(AppImages.bgLight),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          Categories[index],
                                          style: headerTextStyle.copyWith(
                                              fontSize: 14,
                                              color: AppColor.blackColor,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ))),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: PrimaryBtn(
                          title: AppStrings.createCategory,
                          onPress: () {
                            Navigator.pop(context);
                            _createModalBottomSheet(context, name);
                          },
                          color: AppColor.blackColor,
                          textColor: AppColor.whiteColor,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  String? catigorytitle;

  void _createModalBottomSheet(context, name) {
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
              builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: 350,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Create save\n $name",
                          style: headerTextStyle.copyWith(
                              fontSize: 25,
                              color: AppColor.blackColor,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    MyTextField(
                        hintText: AppStrings.enterCategoryTitle,
                        onChange: (value) {
                          catigorytitle = value.toString();
                        },
                        inputType: TextInputType.none),
                    Text(
                      AppStrings.categoryCreateText,
                      style: headerTextStyle.copyWith(
                          fontSize: 14,
                          color: AppColor.greyColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: PrimaryBtn(
                        title: AppStrings.done,
                        onPress: () {
                          catigorytitle!.isEmpty || catigorytitle == null
                              ? Navigator.pop(context)
                              : _successModalBottomSheet(
                                  context, catigorytitle, name);
                        },
                        color: AppColor.blackColor,
                        textColor: AppColor.whiteColor,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  void _successModalBottomSheet(context, catigorytitle, name) {
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
              builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Page $name \nSucessfully",
                          style: headerTextStyle.copyWith(
                              fontSize: 25,
                              color: AppColor.blackColor,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Text.rich(
                      textAlign: TextAlign.left,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Project sucessfully added to the",
                            style: subHeaderTextStyle.copyWith(
                                color: AppColor.textColor,
                                fontSize: 18,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal),
                          ),
                          const TextSpan(text: " "),
                          TextSpan(
                            text: "$catigorytitle",
                            style: headerTextStyle.copyWith(
                                color: AppColor.blackColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: PrimaryBtn(
                        title: AppStrings.done,
                        onPress: () {
                          // Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        color: AppColor.blackColor,
                        textColor: AppColor.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
