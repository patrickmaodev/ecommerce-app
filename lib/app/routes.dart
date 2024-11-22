import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/product_list_screen.dart';
import '../screens/product_detail_screen.dart

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => SplashScreen(),
  '/login': (context) => LoginScreen(),
  '/signup': (context) => SignupScreen(),
  '/dashboard': (context) => CustomerDashboardScreen(),
};