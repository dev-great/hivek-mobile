// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:projectx/app/app_button.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_inputtext.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/logic/profile/profile_view.dart';
import 'package:projectx/screens/profile/Screens/project_student.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  static const String route = '/edit-profile';
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _isFetch = false;
  bool localUser = false;
  String? fullname;
  String? email;
  String? occupation;
  String? phone;

  bool _isLoading = false;
  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final profile = Provider.of<PostDataProvider>(context, listen: false);
    profile.getPostData(context);
    profile.data.data != null ? _isFetch = true : _isFetch = false;
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<PostDataProvider>(context);
    if (storage.getItem("userdetail") == null) {
      if (!_isFetch) {
        storage.setItem("userdetail", profile.data.data);
        print(storage.getItem("userdetail").toString());
      }
    }
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 10, left: 20, right: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _form,
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
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColor.blackColor,
                      child: Positioned(
                        top: 20,
                        left: 20,
                        child: CircleAvatar(
                          radius: 48,
                          backgroundImage: Image.network(
                                  "${storage.getItem("userdetail")["picture"]}")
                              .image,
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
                MyTextField(
                  hintText:
                      "${storage.getItem("userdetail")["first_name"]} ${storage.getItem("userdetail")["last_name"]}",
                  inputType: TextInputType.name,
                  textColor: AppColor.textColor,
                  onChange: (value) {
                    fullname = value.toString();
                  },
                ),
                MyTextField(
                  hintText: "${storage.getItem("userdetail")["email"]}",
                  inputType: TextInputType.name,
                  textColor: AppColor.textColor,
                  onChange: (value) {
                    email = value.toString();
                  },
                ),
                MyTextField(
                  hintText: "${storage.getItem("userdetail")["occupation"]}",
                  inputType: TextInputType.name,
                  textColor: AppColor.textColor,
                  onChange: (value) {
                    occupation = value.toString();
                  },
                ),
                MyTextField(
                  hintText: "${storage.getItem("userdetail")["phone"]}",
                  inputType: TextInputType.name,
                  textColor: AppColor.textColor,
                  onChange: (value) {
                    phone = value.toString();
                  },
                  prefix: Padding(
                    padding:
                        const EdgeInsets.only(top: 13, left: 20, right: 20),
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
                        _oTPValidationlBottomSheet(context);
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
                const Spacer(),
                _isLoading == false
                    ? PrimaryBtn(
                        title: AppStrings.updateInfo,
                        onPress: () {
                          _updateUserProfile();
                        },
                        color: AppColor.blackColor,
                      )
                    : Center(
                        child: const CircularProgressIndicator(
                            color: AppColor.primaryColor),
                      ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _oTPValidationlBottomSheet(context) {
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
                            _updateUserProfile();
                          },
                          color: AppColor.blackColor,
                          textColor: AppColor.whiteColor,
                        )),
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

  void _updateUserProfile() async {
    bool? istokenPhone;
    bool? istokenName;
    bool? istokenOcc;
    bool? istokenEmail;

    var isValid = _form.currentState?.validate();
    setState(() {
      _isLoading = true;
    });
    if (!isValid!) {
      return setState(() {
        _isLoading = false; // your loader has started to load
      });
    }
    _form.currentState?.save();
    if (email!.isNotEmpty) {
      istokenEmail = await Provider.of<UpdateProfileView>(
        context,
        listen: false,
      ).updateProfileEmail(email);
    }
    if (fullname!.isNotEmpty) {
      istokenName = await Provider.of<UpdateProfileView>(
        context,
        listen: false,
      ).updateProfileFull_name(
          fullname!.split(" ")[0], fullname!.split(" ")[1]);
    }
    if (occupation!.isNotEmpty) {
      istokenOcc = await Provider.of<UpdateProfileView>(
        context,
        listen: false,
      ).updateProfileOccupation(occupation);
    }
    if (phone!.isNotEmpty) {
      istokenPhone = await Provider.of<UpdateProfileView>(
        context,
        listen: false,
      ).updateProfilePhone(phone);
    }

    if (istokenEmail! || istokenName! || istokenOcc! || istokenPhone!) {
      void initState() {
        super.initState();
        final profile = Provider.of<PostDataProvider>(context, listen: false);
        profile.getPostData(context);
        profile.data.data != null ? _isFetch = true : _isFetch = false;
      }

      final profile = Provider.of<PostDataProvider>(context);
      if (storage.getItem("userdetail") == null) {
        if (!_isFetch) {
          storage.deleteItem("userderail");
          storage.setItem("userdetail", profile.data.data);
          print(storage.getItem("userdetail").toString());
        }
      }
      setState(() {
        _isLoading = false; // your loader has started to load
      });
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColor.primaryColor,
        content: AwesomeSnackbarContent(
          color: AppColor.primaryColor,
          title: 'Awesome!',
          message: AppStrings.profileUpdateSucess,
          contentType: ContentType.success,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else {
      setState(() {
        _isLoading = false; // your loader has started to load
      });
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColor.dangerColor,
        content: AwesomeSnackbarContent(
          color: AppColor.dangerColor,
          title: 'On Snap!',
          message: AppStrings.profileUpdateError,
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }
}
