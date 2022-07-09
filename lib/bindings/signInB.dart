import 'package:get/get.dart';
import 'package:mountain_trip_api/controls/signInController.dart';

class SignInB implements Bindings {
  @override
  void dependencies() {
    Get.put(SignInC());
  }
}
