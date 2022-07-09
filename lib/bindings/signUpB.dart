import 'package:get/get.dart';
import 'package:mountain_trip_api/controls/signUpController.dart';

class SignUpB implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUpC());
  }
}
