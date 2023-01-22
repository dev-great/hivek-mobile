import 'package:flutter/material.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/logic/auth/otp_verify_view.dart';
import 'package:projectx/logic/auth/passwordless_view.dart';
import 'package:projectx/logic/auth/sso_googlr_view.dart';
import 'package:projectx/routes/route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => RegistrationView()),
        ChangeNotifierProvider(create: (ctx) => SSOGoogleView()),
        ChangeNotifierProvider(create: (ctx) => OTPVerifyView()),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: customRoutes,
      ),
    );
  }
}
