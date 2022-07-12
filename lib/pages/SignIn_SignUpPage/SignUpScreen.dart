import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mountain_trip_api/controls/signUpController.dart';
import 'package:mountain_trip_api/function.dart';
import 'package:mountain_trip_api/utils/utils.dart';

import '../../controls/signInController.dart';
import '../../controls/userController.dart';
import '../../misc/colors.dart';
import '../../widgets/TextFormFieldDesign.dart';

class SignUpScreen extends StatefulWidget {
  final signUpC = Get.find<SignUpC>();
  final usersC = Get.find<UserController>();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String hideEmal = "";
  @override
  void sendOTP() async {
    if (widget.signUpC.emailC.text != "" &&
        widget.signUpC.phoneNoC.text != "" &&
        widget.signUpC.passC.text != "" &&
        widget.signUpC.repassC.text != "") {
      String otpCode = await Function1().sendEmail(widget.signUpC.emailC.text);
      if (otpCode == "error") {
        return;
      }
      setState(() {
        hideEmal = "";
        int check = 0;
        for (int i = 0; i < widget.signUpC.emailC.text.length; i++) {
          if (widget.signUpC.emailC.text[i] == "@") {
            check = 1;
          }
          if (check == 0 && i > 2) {
            hideEmal += "*";
          } else {
            hideEmal += widget.signUpC.emailC.text[i];
          }
        }
        widget.signUpC.otp_code = otpCode;
        widget.signUpC.pages = 1;
        SnackBarNoti("OTP code send", "OTP code is sent");
      });
    } else {
      SnackBarError("Field is not null");
    }
  }

  void reSendOTP() async {
    String otpCode = await Function1().sendEmail(widget.signUpC.emailC.text);
    if (otpCode == "error") {
      return;
    }
    setState(() {
      widget.signUpC.otp_code = otpCode;
      SnackBarNoti("OTP code send", "OTP code is Resent");
    });
  }

  void signUp() {
    String inputOtp = widget.signUpC.otp1.text +
        widget.signUpC.otp2.text +
        widget.signUpC.otp3.text +
        widget.signUpC.otp4.text;
    print(widget.signUpC.otp_code);
    if (inputOtp == widget.signUpC.otp_code) {
      widget.usersC.SignUp(
        widget.signUpC.emailC.text,
        widget.signUpC.passC.text,
        widget.signUpC.repassC.text,
        widget.signUpC.phoneNoC.text,
      );
    } else {
      SnackBarError("OTP code is invalid");
    }
  }

  void nextField({required String value, FocusNode? focuseNode}) {
    if (value.length == 1) {
      focuseNode?.requestFocus();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/img/mountain.jpeg'),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black26,
                  AppColors.mainColor,
                ],
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              (widget.signUpC.pages == 0)
                  ? Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 1.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Container(
                              height: 150,
                              child: Image(
                                image:
                                    AssetImage('assets/img/MountainLogo.png'),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                children: [
                                  TextFormFieldDesgin(
                                    control: widget.signUpC.emailC,
                                    hintText: "Enter your Email",
                                    labelText: "Email",
                                    icon: Icons.person,
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormFieldDesgin(
                                    control: widget.signUpC.phoneNoC,
                                    hintText: "Enter your phoneNumber",
                                    labelText: "Phone Number",
                                    icon: Icons.phone,
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormFieldPassword(
                                    control: widget.signUpC.passC,
                                    hintText: "Enter your Password",
                                    labelText: "Password",
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormFieldPassword(
                                    control: widget.signUpC.repassC,
                                    hintText: "Enter Re PassWord",
                                    labelText: "Re_Password",
                                  ),
                                  const SizedBox(height: 7),
                                  const SizedBox(height: 17),
                                  InkWell(
                                    onTap: () {
                                      sendOTP();
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.mainColor,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/img/button-one.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 1.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Container(
                              height: 150,
                              child: Image(
                                image:
                                    AssetImage('assets/img/MountainLogo.png'),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'OTP Verification',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'We sent your code to ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  hideEmal,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'This code will expried in ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  '00:30',
                                  style: TextStyle(
                                    color: AppColors.mainColor,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 60,
                                    child: TextFormField(
                                      controller: widget.signUpC.otp1,
                                      autofocus: true,
                                      obscureText: true,
                                      style: TextStyle(fontSize: 24),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: AppColors.mainColor,
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: AppColors.mainColor,
                                              width: 2),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        nextField(
                                            value: value,
                                            focuseNode:
                                                widget.signUpC.pin2FocusNode);
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    width: 60,
                                    child: TextFormField(
                                      controller: widget.signUpC.otp2,
                                      obscureText: true,
                                      style: TextStyle(fontSize: 24),
                                      focusNode: widget.signUpC.pin2FocusNode,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: AppColors.mainColor,
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: AppColors.mainColor,
                                              width: 2),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        nextField(
                                            value: value,
                                            focuseNode:
                                                widget.signUpC.pin3FocusNode);
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    width: 60,
                                    child: TextFormField(
                                      controller: widget.signUpC.otp3,
                                      obscureText: true,
                                      focusNode: widget.signUpC.pin3FocusNode,
                                      style: TextStyle(fontSize: 24),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: AppColors.mainColor,
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: AppColors.mainColor,
                                              width: 2),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        nextField(
                                            value: value,
                                            focuseNode:
                                                widget.signUpC.pin4FocusNode);
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    width: 60,
                                    child: TextFormField(
                                      controller: widget.signUpC.otp4,
                                      focusNode: widget.signUpC.pin4FocusNode,
                                      obscureText: true,
                                      style: TextStyle(fontSize: 24),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: AppColors.mainColor,
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: AppColors.mainColor,
                                              width: 2),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        widget.signUpC.pin4FocusNode.unfocus();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 60),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        widget.signUpC.pages = 0;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 2,
                                            color: AppColors.mainColor),
                                      ),
                                      child: Icon(Icons.arrow_back_ios,
                                          color: AppColors.mainColor),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        signUp();
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppColors.mainColor,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/img/button-one.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                reSendOTP();
                              },
                              child: Text(
                                'Resend Otp Code',
                                style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
