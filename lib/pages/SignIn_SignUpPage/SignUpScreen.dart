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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/mountain.jpeg'),
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
              Container(
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
                          image: AssetImage('assets/img/MountainLogo.png'),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                // widget.usersC.SignUp(
                                //     widget.signUpC.emailC.text,
                                //     widget.signUpC.passC.text,
                                //     widget.signUpC.repassC.text,
                                //     "null");
                                Function1()
                                    .sendEmail(widget.signUpC.emailC.text);
                              },
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.mainColor,
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/img/button-one.png'),
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
            ],
          ),
        ],
      ),
    );
  }
}
