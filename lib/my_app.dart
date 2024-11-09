import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_online/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: AppRoute.generateRoute,
      navigatorKey: Get.key,
      initialRoute: AppRoute.splashScreen,
    );
  }
}
