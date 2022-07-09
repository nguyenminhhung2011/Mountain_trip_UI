import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mountain_trip_api/controls/signInController.dart';
import 'package:mountain_trip_api/controls/userController.dart';
import 'package:mountain_trip_api/pages/SignIn_SignUpPage/SignUpScreen.dart';
import 'package:mountain_trip_api/widgets/responsiveButton.dart';

import '../../misc/colors.dart';
import '../../routes/routName.dart';
import '../../widgets/TextFormFieldDesign.dart';
import '../mainPages.dart/mainPages.dart';

class SignInScreen extends StatelessWidget {
  final signInC = Get.find<SignInC>();
  final usersC = Get.find<UserController>();
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
                height: MediaQuery.of(context).size.height / 1.6,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: 40,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: AppColors.mainColor,
                                ),
                              ),
                              child: Image(
                                image: AssetImage('assets/img/facebook.png'),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: 40,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: AppColors.mainColor,
                                ),
                              ),
                              child: Image(
                                image: AssetImage('assets/img/google.png'),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: 40,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: AppColors.mainColor,
                                ),
                              ),
                              child: Image(
                                image: AssetImage('assets/img/apple.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            TextFormFieldDesgin(
                              control: signInC.emailC,
                              hintText: "Enter your Email",
                              labelText: "Email",
                            ),
                            const SizedBox(height: 20),
                            TextFormFieldPassword(
                              control: signInC.passC,
                              hintText: "Enter your Password",
                              labelText: "Password",
                            ),
                            const SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Forgot your password',
                                    style: TextStyle(
                                      color:
                                          AppColors.textColor2.withOpacity(0.5),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 17),
                            ResponSiveButton(
                                tittle: "",
                                press: () {
                                  usersC.SignIn(
                                      signInC.emailC.text, signInC.passC.text);
                                }),
                            const SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have account? ',
                                  style: TextStyle(
                                    color:
                                        AppColors.textColor2.withOpacity(0.7),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(RouteName.signUp);
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
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
