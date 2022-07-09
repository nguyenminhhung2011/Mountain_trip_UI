import 'package:get/get.dart';
import 'package:mountain_trip_api/bindings/signInB.dart';
import 'package:mountain_trip_api/controls/signUpController.dart';
import 'package:mountain_trip_api/pages/SignIn_SignUpPage/SignInScreen.dart';
import 'package:mountain_trip_api/pages/SignIn_SignUpPage/SignUpScreen.dart';
import 'package:mountain_trip_api/pages/home_screen_pages.dart';
import 'package:mountain_trip_api/routes/routName.dart';

import '../bindings/signUpB.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.welcome,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: RouteName.signIn,
      page: () => SignInScreen(),
      binding: SignInB(),
    ),
    GetPage(
      name: RouteName.signUp,
      page: () => SignUpScreen(),
      binding: SignUpB(),
    ),
  ];
}
