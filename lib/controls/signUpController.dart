import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpC extends GetxController {
  late TextEditingController emailC;
  late TextEditingController passC;
  late TextEditingController repassC;
  late TextEditingController phoneNoC;
  late int pages = 0;
  late int otp_code = 0;
  @override
  void onInit() {
    super.onInit();
    emailC = TextEditingController();
    passC = TextEditingController();
    repassC = TextEditingController();
    phoneNoC = TextEditingController();
    emailC.text = "hungnguyen.201102ak@gmail.com";
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    repassC.dispose();
    phoneNoC.dispose();
    otp_code = 0;
    super.onClose();
  }
}
