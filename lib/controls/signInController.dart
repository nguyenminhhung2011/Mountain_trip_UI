import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInC extends GetxController {
  late TextEditingController emailC;
  late TextEditingController passC;
  late TextEditingController newPassC;
  late TextEditingController rePassC;
  late int pages = 0;
  late String otp_code = "";

  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  late TextEditingController otp1;
  late TextEditingController otp2;
  late TextEditingController otp3;
  late TextEditingController otp4;

  @override
  @override
  void onInit() {
    super.onInit();
    emailC = TextEditingController();
    passC = TextEditingController();
    newPassC = TextEditingController();
    rePassC = TextEditingController();

    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();

    otp1 = TextEditingController();
    otp2 = TextEditingController();
    otp3 = TextEditingController();
    otp4 = TextEditingController();
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    pages = 0;
    otp_code = "";
    newPassC.dispose();
    rePassC.dispose();

    otp1.dispose();
    otp2.dispose();
    otp3.dispose();
    otp4.dispose();

    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.onClose();
  }
}
