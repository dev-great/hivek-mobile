import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_image.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/screens/auth_screen/acknowledgement.dart';
import 'package:projectx/screens/profile/Screens/edit_profile.dart';
import 'package:projectx/screens/profile/Screens/upload_project.dart';

class AccountScreen extends StatefulWidget {
  static const String route = '/account';
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Container(
        color: AppColor.blackColor,
        child: Stack(
          children: [
            Container(
              color: AppColor.whiteColor,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3.5,
                    left: 20,
                    right: 20,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.name,
                          style: headerTextStyle.copyWith(
                            color: AppColor.blackColor,
                            fontSize: 24,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          AppStrings.matricNo,
                          style: headerTextStyle.copyWith(
                            color: AppColor.greyColor,
                            fontSize: 18,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 84,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.greyColor.withOpacity(0.3),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.warning_amber,
                                  color: AppColor.blackColor,
                                ),
                                Text(
                                  AppStrings.addVerifyNo,
                                  style: bodyTextStyle.copyWith(
                                    color: AppColor.blackColor,
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, EditProfile.route);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: AppColor.blackColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        AppStrings.verify,
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
                          )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 84,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.greyColor.withOpacity(0.3),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.warning_amber,
                                  color: AppColor.blackColor,
                                ),
                                Text(
                                  AppStrings.updateEmail,
                                  style: bodyTextStyle.copyWith(
                                    color: AppColor.blackColor,
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, EditProfile.route);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: AppColor.blackColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        AppStrings.update,
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
                          )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, EditProfile.route);
                          },
                          child: ListTile(
                              leading: const Icon(
                                Iconsax.user,
                                color: AppColor.blackColor,
                              ),
                              title: Text(
                                AppStrings.editProfile,
                                style: bodyTextStyle.copyWith(
                                  color: AppColor.blackColor,
                                ),
                              ),
                              trailing: const Icon(
                                Iconsax.arrow_right,
                                color: AppColor.blackColor,
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, UploadProject.route);
                          },
                          child: ListTile(
                              leading: const Icon(
                                Iconsax.document_upload,
                                color: AppColor.blackColor,
                              ),
                              title: Text(
                                AppStrings.projectUpload,
                                style: bodyTextStyle.copyWith(
                                  color: AppColor.blackColor,
                                ),
                              ),
                              trailing: const Icon(
                                Iconsax.arrow_right,
                                color: AppColor.blackColor,
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Acknowledgement.route,
                              arguments: {
                                'isSettings': true,
                              },
                            );
                          },
                          child: ListTile(
                              leading: const Icon(
                                Iconsax.info_circle,
                                color: AppColor.blackColor,
                              ),
                              title: Text(
                                AppStrings.aboutHivek,
                                style: bodyTextStyle.copyWith(
                                  color: AppColor.blackColor,
                                ),
                              ),
                              trailing: const Icon(
                                Iconsax.arrow_right,
                                color: AppColor.blackColor,
                              )),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: ListTile(
                            leading: const Icon(
                              Iconsax.logout_1,
                              color: AppColor.dangerColor,
                            ),
                            title: Text(
                              AppStrings.logOut,
                              style: bodyTextStyle.copyWith(
                                color: AppColor.dangerColor,
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
            Container(
              height: MediaQuery.of(context).size.height / 5.5,
              width: MediaQuery.of(context).size.width,
              color: AppColor.blackColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40, right: 20),
                    child: Image.asset(AppImages.logoGray),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 9, left: 20),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: AppColor.blackColor,
                child: Positioned(
                  top: 20,
                  left: 20,
                  child: CircleAvatar(
                    radius: 46,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1612720779828-8ba209f069ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTM4fHxzdWl0ZSUyMGJsYWNrbWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
