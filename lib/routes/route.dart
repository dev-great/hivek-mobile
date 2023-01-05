import 'package:flutter/material.dart';
import 'package:projectx/screens/auth_screen/acknowledgement.dart';
import 'package:projectx/screens/auth_screen/auth_email_validation.dart';
import 'package:projectx/screens/auth_screen/auth_forgotten_password.dart';
import 'package:projectx/screens/auth_screen/auth_signin.dart';
import 'package:projectx/screens/auth_screen/auth_signup.dart';
import 'package:projectx/screens/auth_screen/tell_more.dart';
import 'package:projectx/screens/base.dart';
import 'package:projectx/screens/bookmarks/bookmark.dart';
import 'package:projectx/screens/dashboard/dashboard.dart';
import 'package:projectx/screens/profile/Screens/edit_profile.dart';
import 'package:projectx/screens/profile/Screens/smart_upload.dart';
import 'package:projectx/screens/profile/Screens/upload_project.dart';
import 'package:projectx/screens/profile/account.dart';
import 'package:projectx/screens/project/project.dart';
import 'package:projectx/screens/search/search.dart';
import 'package:projectx/screens/splash_screen/splash_screen.dart';
import 'package:projectx/screens/welcome_screen/welcome_screen.dart';

var customRoutes = <String, WidgetBuilder>{
  SplashScreen.route: (context) => const SplashScreen(),
  WelcomeScreen.route: (context) => const WelcomeScreen(),
  SignIn.route: (context) => const SignIn(),
  SignUp.route: (context) => const SignUp(),
  ForgottenPassword.route: (context) => const ForgottenPassword(),
  EmailValidation.route: (context) => const EmailValidation(),
  TellMore.route: (context) => const TellMore(),
  Acknowledgement.route: (context) => const Acknowledgement(),
  AccountScreen.route: (context) => const AccountScreen(),
  SearchScreen.route: (context) => const SearchScreen(),
  DashboardScreen.route: (context) => const DashboardScreen(),
  ProjectScreen.route: (context) => const ProjectScreen(),
  BookmarkScreen.route: (context) => const BookmarkScreen(),
  BaseScreen.route: (context) => const BaseScreen(),
  EditProfile.route: (context) => const EditProfile(),
  UploadProject.route: (context) => const UploadProject(),
  SmartUpload.route: (context) => const SmartUpload(),
};
