import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:projectx/app/app_button.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_inputtext.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/screens/profile/Screens/smart_upload.dart';

class UploadProject extends StatefulWidget {
  static const String route = '/upload_project';
  const UploadProject({super.key});

  @override
  State<UploadProject> createState() => _UploadProjectState();
}

class _UploadProjectState extends State<UploadProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 10,
              left: 20,
              right: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
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
                  AppStrings.smartUpload,
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
                  AppStrings.smartUploadText,
                  style: bodyTextStyle.copyWith(
                      fontSize: 14,
                      color: AppColor.greyColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 8,
                ),
                const MyTextField(
                  hintText: AppStrings.selectFiles,
                  inputType: TextInputType.none,
                  prefix: Icon(Iconsax.document_upload),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  AppStrings.linkToSoftWare,
                  style: bodyTextStyle.copyWith(
                      fontSize: 14,
                      color: AppColor.greyColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 8,
                ),
                const MyTextField(
                  hintText: AppStrings.githubLink,
                  inputType: TextInputType.none,
                ),
                const Spacer(),
                PrimaryBtn(
                  title: AppStrings.upload,
                  onPress: () {
                    Navigator.pushNamed(context, SmartUpload.route);
                  },
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
