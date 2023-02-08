import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:projectx/app/app_button.dart';
import 'package:projectx/app/app_color.dart';
import 'package:projectx/app/app_decoration.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/logic/auth/passwordless_view.dart';
import 'package:projectx/screens/auth_screen/auth_email_validation.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  static const String route = '/signup';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isActive = false;
  String? _email;
  TextEditingController emailController = TextEditingController();

  bool _isLoading = false;
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: AppColor.blackColor),
          ),
          elevation: 0,
          backgroundColor: AppColor.whiteColor),
      body: Container(
        color: AppColor.whiteColor,
        child: SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    AppStrings.welcomeToHivek,
                    style: headerTextStyle.copyWith(
                        fontSize: 40,
                        color: AppColor.blackColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    AppStrings.createAccount,
                    style: bodyTextStyle.copyWith(
                        fontSize: 16,
                        color: AppColor.blackColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: _form,
                child: TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: bodyTextStyle.copyWith(color: AppColor.blackColor),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColor.textColor),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColor.textColor),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    fillColor: AppColor.blackColor,
                    hintText: AppStrings.email,
                    hintStyle: bodyTextStyle.copyWith(
                      color: AppColor.textColor.withOpacity(0.4),
                    ),
                  ),
                  onChanged: (v) {
                    if (v.contains('.com')) {
                      setState(() {
                        _isActive = true;
                        _email = v.toString();
                      });
                    } else {
                      setState(() {
                        _isActive = false;
                      });
                    }
                  },
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Enter Your Email Address';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              _isLoading == false
                  ? PrimaryBtn(
                      title: AppStrings.continueText,
                      onPress: () {
                        _isActive == true ? _loginNew() : () {};
                      },
                      color: _isActive == true
                          ? AppColor.blackColor
                          : AppColor.greyColor,
                      textColor: _isActive == true
                          ? AppColor.whiteColor
                          : AppColor.textColor.withOpacity(0.3),
                    )
                  : const CircularProgressIndicator(
                      color: AppColor.primaryColor)
            ],
          ),
        )),
      ),
    );
  }

  void _loginNew() async {
    var isValid = _form.currentState?.validate();
    setState(() {
      _isLoading = true;
    });
    if (!isValid!) {
      return setState(() {
        _isLoading = false;
      });
    }
    _form.currentState?.save();
    print(_email);
    bool istoken = await Provider.of<RegistrationView>(
      context,
      listen: false,
    ).passwordless(_email!);
    print(istoken);

    if (istoken) {
      Navigator.pushNamed(context, EmailValidation.route);
      setState(() {
        _isLoading = false;
      });
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColor.primaryColor,
        content: AwesomeSnackbarContent(
          color: AppColor.primaryColor,
          title: 'Awesome!',
          message: AppStrings.passwordlessSucess,
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
          message: AppStrings.passwordlessError,
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }
}
