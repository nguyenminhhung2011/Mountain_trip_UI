import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProFileC extends GetxController {
  late TextEditingController nameC;
  late TextEditingController phoneC;
  late TextEditingController emailC;
  late TextEditingController passC;
  late TextEditingController newPassC;
  late TextEditingController rePsasC;
  late int checkPages = 0;
  @override
  void onInit() {
    super.onInit();
    nameC = TextEditingController();
    emailC = TextEditingController();
    passC = TextEditingController();
    phoneC = TextEditingController();
    newPassC = TextEditingController();
    rePsasC = TextEditingController();
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    nameC.dispose();
    phoneC.dispose();
    newPassC.dispose();
    rePsasC.dispose();
    checkPages = 0;
    super.onClose();
  }
}
