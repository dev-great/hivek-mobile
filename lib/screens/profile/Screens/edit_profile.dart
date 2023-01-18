import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectx/app/app_button.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_inputtext.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/screens/profile/Screens/project_student.dart';

class EditProfile extends StatefulWidget {
  static const String route = '/edit-profile';
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 10, left: 20, right: 20),
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                    AppStrings.editProfile,
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
              Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColor.blackColor,
                    child: Positioned(
                      top: 20,
                      left: 20,
                      child: CircleAvatar(
                        radius: 48,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1612720779828-8ba209f069ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTM4fHxzdWl0ZSUyMGJsYWNrbWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, EditProfile.route);
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: AppColor.blackColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          AppStrings.changeImage,
                          style: bodyTextStyle.copyWith(
                            color: AppColor.whiteColor,
                            fontSize: 14,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const MyTextField(
                hintText: AppStrings.name,
                inputType: TextInputType.name,
                textColor: AppColor.textColor,
              ),
              const MyTextField(
                hintText: AppStrings.matricNo,
                inputType: TextInputType.name,
                textColor: AppColor.textColor,
              ),
              const MyTextField(
                hintText: AppStrings.abdulldsgnr,
                inputType: TextInputType.name,
                textColor: AppColor.textColor,
              ),
              MyTextField(
                hintText: AppStrings.verifyPhone,
                inputType: TextInputType.name,
                textColor: AppColor.textColor,
                prefix: Padding(
                  padding: const EdgeInsets.only(top: 13, left: 20, right: 20),
                  child: Text(
                    "+234",
                    style: bodyTextStyle.copyWith(
                      color: AppColor.blackColor,
                      fontSize: 14,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                suffix: Padding(
                  padding: const EdgeInsets.only(top: 13, right: 20),
                  child: GestureDetector(
                    onTap: () {
                      _OTPValidationlBottomSheet(context);
                    },
                    child: Text(
                      AppStrings.verify,
                      style: bodyTextStyle.copyWith(
                        color: AppColor.greyColor,
                        fontSize: 12,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
              const MyTextField(
                hintText: AppStrings.department,
                inputType: TextInputType.name,
                textColor: AppColor.textColor,
              ),
              Spacer(),
              PrimaryBtn(
                title: AppStrings.updateInfo,
                onPress: () {},
                color: AppColor.blackColor,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }

  void _OTPValidationlBottomSheet(context) {
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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SizedBox(
                height: 340,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.enterOTP1,
                      style: headerTextStyle.copyWith(
                          fontSize: 25,
                          color: AppColor.blackColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      AppStrings.sentTo,
                      style: bodyTextStyle.copyWith(
                          fontSize: 18,
                          color: AppColor.blackColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal),
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
                          Navigator.pushNamed(context, ProjectStudent.route);
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
