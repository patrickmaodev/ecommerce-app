import 'package:ecommerce_app/features/auth/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/screens/register_screen.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/features/home/screens/home_screen.dart';
import 'package:ecommerce_app/features/splash/screens/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';

  /// Returns initial route with optional query parameter
  static String getInitialRoute({bool fromSplash = false}) => '$initial?from-splash=$fromSplash';

  static String getSplashRoute() => splash;

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => HomeScreen(pageIndex: 0, fromSplash: Get.parameters['from-splash'] == 'true'),
    ),
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: signIn,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: signUp,
      page: () => RegisterScreen(),
    ),
  ];
}
