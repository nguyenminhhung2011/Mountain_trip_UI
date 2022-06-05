import 'package:get/get.dart';
import 'package:mountain_trip_api/pages/SignIn_SignUpPage/SignInScreen.dart';

import '../models/user.dart';
import '../pages/Home/HomeScreen.dart';

class AuthControls extends GetConnect {
  static AuthControls instance = Get.find();
  late Rx<User?> _user;
  User get user => _user.value!;
  @override
  void onReady() {
    super.onReady();
    ever(_user, _setIntialScreen);
  }

  _setIntialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const SignInScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }
}
