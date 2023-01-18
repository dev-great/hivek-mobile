import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:projectx/app/app_button.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_image.dart';
import 'package:projectx/app/app_inputtext.dart';
import 'package:projectx/app/app_string.dart';

class ProjectStudent extends StatefulWidget {
  static const String route = '/project-student';
  const ProjectStudent({super.key});

  @override
  State<ProjectStudent> createState() => _ProjectStudentState();
}

class _ProjectStudentState extends State<ProjectStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 10,
                left: 20,
                right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                      width: 10,
                    ),
                    Text(
                      AppStrings.projectUpload,
                      style: headerTextStyle.copyWith(
                        color: AppColor.blackColor,
                        fontSize: 24,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  AppStrings.applyToBeProjectStudent,
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
                  AppStrings.applyToBeProjectStudentText,
                  style: bodyTextStyle.copyWith(
                      fontSize: 14,
                      color: AppColor.greyColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 8,
                ),
                MyTextField(
                  hintText: AppStrings.department,
                  inputType: TextInputType.none,
                  suffix: Icon(FeatherIcons.chevronDown),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  AppStrings.enterMatricNumber,
                  style: bodyTextStyle.copyWith(
                      fontSize: 16,
                      color: AppColor.greyColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                ),
                const MyTextField(
                  hintText: AppStrings.enterNumberHere,
                  inputType: TextInputType.none,
                ),
                Spacer(),
                PrimaryBtn(
                  title: AppStrings.send,
                  onPress: () {},
                  color: AppColor.blackColor,
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
