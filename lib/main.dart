import 'package:flutter/material.dart';
import 'package:projectx/app/app_string.dart';
import 'package:projectx/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: customRoutes,
    );
  }
}
