// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:projectx/app/app_button.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/logic/profile/profile_view.dart';
import 'package:projectx/screens/auth_screen/acknowledgement.dart';
import 'package:projectx/screens/auth_screen/components/schoolsModel.dart';
import 'package:provider/provider.dart';

class TellMore extends StatefulWidget {
  static const String route = '/tellMore';
  const TellMore({super.key});

  @override
  State<TellMore> createState() => _TellMoreState();
}

class _TellMoreState extends State<TellMore> {
  bool isActiveDo = false;
  bool _isActiveSchool = false;
  String? whatYouDo;
  String? school;
  String? _result;
  List<String> searchResult = [];

  bool _isLoading = false;

  LocalStorage storage = LocalStorage('usertoken');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
        child: Column(children: [
          Row(
            children: [
              Text(
                AppStrings.appName,
                style: headerTextStyle.copyWith(
                    fontSize: 30,
                    color: AppColor.textColor.withOpacity(0.3),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                AppStrings.tellUsMoreText,
                style: headerTextStyle.copyWith(
                    fontSize: 38,
                    color: AppColor.blackColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              _whatYouDoModalBottomSheet(context);
            },
            child: Container(
              height: 65,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                border: Border.all(
                    color: whatYouDo != null
                        ? AppColor.blackColor
                        : AppColor.textColor.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(children: [
                  Text(
                    whatYouDo != null
                        ? whatYouDo.toString()
                        : AppStrings.whatDoYouDo,
                    style: bodyTextStyle.copyWith(
                        fontSize: 15,
                        color: whatYouDo != null
                            ? AppColor.blackColor
                            : AppColor.textColor.withOpacity(0.3)),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: whatYouDo != null
                        ? AppColor.blackColor
                        : AppColor.textColor.withOpacity(0.3),
                  )
                ]),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              _searchSchoolModalBottomSheet(context);
            },
            child: Container(
              height: 65,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                border: Border.all(
                    color: school != null
                        ? AppColor.blackColor
                        : AppColor.textColor.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(children: [
                  Expanded(
                    child: Text(
                      school != null
                          ? school.toString()
                          : AppStrings.whatSchool,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: bodyTextStyle.copyWith(
                          fontSize: 15,
                          color: school != null
                              ? AppColor.blackColor
                              : AppColor.textColor.withOpacity(0.3)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: school != null
                          ? AppColor.blackColor
                          : AppColor.textColor.withOpacity(0.3),
                    ),
                  )
                ]),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _isLoading == false
              ? PrimaryBtn(
                  title: AppStrings.continueText,
                  onPress: () {
                    print(
                        "{credential: ${storage.getItem('credential').toString()}");
                    school != null && whatYouDo != null
                        ? _updateProfileOccupation()
                        : () {};
                  },
                  color: school != null && whatYouDo != null
                      ? AppColor.blackColor
                      : AppColor.greyColor,
                  textColor: school != null && whatYouDo != null
                      ? AppColor.whiteColor
                      : AppColor.textColor.withOpacity(0.3),
                )
              : const CircularProgressIndicator(color: AppColor.primaryColor),
        ]),
      ),
    ));
  }

  List items = [];

  @override
  void initState() {
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(schoolModel);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];

      dummyListData = schoolModel
          .where((value) => value.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(schoolModel);
      });
    }
  }

  void _selectedSchool(value) {
    setState(() {
      school = value.toString();
    });
  }

  void _searchSchoolModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        items.addAll(schoolModel);
        TextEditingController searchController = TextEditingController();
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
              height: MediaQuery.of(context).size.height - 70,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          AppStrings.whatSchool2,
                          style: headerTextStyle.copyWith(
                              fontSize: 25,
                              color: AppColor.blackColor,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        style: bodyTextStyle.copyWith(
                            fontSize: 15, color: AppColor.blackColor),
                        onChanged: (value) {
                          setState(() {
                            filterSearchResults(value);
                          });
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.textColor.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.textColor.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          fillColor: AppColor.blackColor,
                          hintText: AppStrings.searchForInstitutions,
                          hintStyle: bodyTextStyle.copyWith(
                            fontSize: 15,
                            color: AppColor.textColor.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: items.isEmpty
                          ? Column(
                              children: const [
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                    child: Text('No results',
                                        style: subHeaderTextStyle),
                                  ),
                                )
                              ],
                            )
                          : ListView.builder(
                              itemCount: items.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, top: 10),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedSchool(items[index]);
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      items[index],
                                      style:
                                          bodyTextStyle.copyWith(fontSize: 15),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ));
        });
      },
    );
  }

  void _whatYouDoResult(value) {
    setState(() {
      whatYouDo = value.toString();
    });
  }

  void _whatYouDoModalBottomSheet(context) {
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
            return SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.whatDoYouDo,
                          style: headerTextStyle.copyWith(
                              fontSize: 25,
                              color: AppColor.blackColor,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RadioListTile(
                        title: Text(
                          AppStrings.student,
                          style: bodyTextStyle.copyWith(
                            color: AppColor.blackColor,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        value: 'student',
                        groupValue: whatYouDo,
                        onChanged: (value) {
                          setState(() {
                            _whatYouDoResult(value);
                          });
                        },
                        activeColor: AppColor.greenColor,
                        selected: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      RadioListTile(
                        title: Text(
                          AppStrings.lecturer,
                          style: bodyTextStyle.copyWith(
                            color: AppColor.blackColor,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        value: 'lecturer',
                        groupValue: whatYouDo,
                        onChanged: (value) {
                          setState(() {
                            _whatYouDoResult(value);
                          });
                        },
                        activeColor: AppColor.greenColor,
                        selected: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: PrimaryBtn(
                      title: AppStrings.continueText,
                      onPress: () {
                        Navigator.pop(context);
                      },
                      color: whatYouDo != null
                          ? AppColor.blackColor
                          : AppColor.greyColor,
                      textColor: whatYouDo != null
                          ? AppColor.whiteColor
                          : AppColor.textColor.withOpacity(0.3),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          });
        });
  }

  void _updateProfileOccupation() async {
    print(whatYouDo);
    setState(() {
      _isLoading = true;
    });
    bool istoken = await Provider.of<UpdateProfileView>(
      context,
      listen: false,
    ).updateProfileOccupation(whatYouDo);
    if (istoken) {
      Navigator.pushNamed(
        context,
        Acknowledgement.route,
        arguments: {
          'isSettings': false,
        },
      );
      setState(() {
        _isLoading = false; // your loader has started to load
        storage.deleteItem("token");
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
