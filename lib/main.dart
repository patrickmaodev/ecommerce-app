import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/app/app_theme.dart';
import 'package:ecommerce_app/helpers/route_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AnyWhere App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: RouteHelper.getSplashRoute(),
      getPages: RouteHelper.routes,
    );
  }
}
