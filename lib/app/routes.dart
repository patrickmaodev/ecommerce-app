import 'package:flutter/material.dart';

import '../screens/signin_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/welcome_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const WelcomeScreen(),
  '/login': (context) => const SigninScreen(),
  '/signup': (context) => const SignupScreen(),
};