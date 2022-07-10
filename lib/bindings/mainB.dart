import 'package:get/get.dart';
import 'package:mountain_trip_api/controls/mainPagge_controller.dart';
import 'package:mountain_trip_api/controls/profileControl.dart';
import 'package:mountain_trip_api/controls/signInController.dart';

class MainB implements Bindings {
  @override
  void dependencies() {
    Get.put(MainPageC());
    Get.put(ProFileC());
  }
}
