import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProFileC extends GetxController {
  late TextEditingController nameC;
  late TextEditingController phoneC;
  late TextEditingController emailC;
  late TextEditingController passC;

  @override
  void onInit() {
    super.onInit();
    nameC = TextEditingController();
    emailC = TextEditingController();
    passC = TextEditingController();
    phoneC = TextEditingController();
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    nameC.dispose();
    phoneC.dispose();
    super.onClose();
  }
}
