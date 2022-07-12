import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpC extends GetxController {
  late TextEditingController emailC;
  late TextEditingController passC;
  late TextEditingController repassC;
  late TextEditingController phoneNoC;
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
  void onInit() {
    super.onInit();
    emailC = TextEditingController();
    passC = TextEditingController();
    repassC = TextEditingController();
    phoneNoC = TextEditingController();
    emailC.text = "hungnguyen.201102ak@gmail.com";
    phoneNoC.text = "0935703991";
    passC.text = "minhhung";
    repassC.text = "minhhung";

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
    repassC.dispose();
    phoneNoC.dispose();

    otp1.dispose();
    otp2.dispose();
    otp3.dispose();
    otp4.dispose();
    otp_code = "";

    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();

    super.onClose();
  }
}
