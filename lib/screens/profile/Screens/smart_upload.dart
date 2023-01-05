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

class SmartUpload extends StatefulWidget {
  static const String route = '/smartupload';
  const SmartUpload({super.key});

  @override
  State<SmartUpload> createState() => _SmartUploadState();
}

class _SmartUploadState extends State<SmartUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 10, left: 20, right: 20),
        child: SingleChildScrollView(
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
              SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.smartUploadText2,
                style: bodyTextStyle.copyWith(
                    fontSize: 14,
                    color: AppColor.greyColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(AppImages.bgLight),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              MyTextField(
                hintText: AppStrings.uploadTitle,
                inputType: TextInputType.none,
                prefix: Icon(Iconsax.document_upload),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                AppStrings.projectBy1,
                style: bodyTextStyle.copyWith(
                    fontSize: 16,
                    color: AppColor.greyColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal),
              ),
              MyTextField(
                hintText: AppStrings.name,
                inputType: TextInputType.none,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                AppStrings.supervisedBy,
                style: bodyTextStyle.copyWith(
                    fontSize: 16,
                    color: AppColor.greyColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal),
              ),
              MyTextField(
                hintText: AppStrings.eFAminu,
                inputType: TextInputType.none,
              ),
              SizedBox(
                height: 15,
              ),
              PrimaryBtn(
                title: AppStrings.send,
                onPress: () {},
                color: AppColor.blackColor,
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
