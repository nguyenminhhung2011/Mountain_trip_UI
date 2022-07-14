import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mountain_trip_api/controls/signInController.dart';
import 'package:mountain_trip_api/controls/userController.dart';
import 'package:mountain_trip_api/function.dart';
import 'package:mountain_trip_api/pages/SignIn_SignUpPage/SignUpScreen.dart';
import 'package:mountain_trip_api/utils/utils.dart';
import 'package:mountain_trip_api/widgets/responsiveButton.dart';

import '../../misc/colors.dart';
import '../../routes/routName.dart';
import '../../widgets/TextFormFieldDesign.dart';
import '../mainPages.dart/mainPages.dart';

PageController pageController = PageController(initialPage: 0, keepPage: true);
void onButtonTape(int index) {
  pageController.animateToPage(index,
      duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
//  pageController.jumpToPage(index);
}

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final signInC = Get.find<SignInC>();

  final usersC = Get.find<UserController>();
  String hideEmail = "";

  @override
  void sendOTPCode() async {
    if (signInC.emailC.text != "") {
      String otpCode =
          await Function1().sendEmail_forgotPassword(signInC.emailC.text);
      if (otpCode == "error") {
        return;
      }
      setState(() {
        hideEmail = "";
        int check = 0;
        for (int i = 0; i < signInC.emailC.text.length; i++) {
          if (signInC.emailC.text[i] == '@') {
            check = 1;
          }
          if (i > 2 && check == 0) {
            hideEmail += "*";
          } else {
            hideEmail += signInC.emailC.text[i];
          }
        }
        signInC.otp_code = otpCode;
        signInC.pages = 2;
        SnackBarNoti("OTP code send", "OTP code is sent");
      });
    } else {
      SnackBarError("Field is not null");
    }
  }

  void nextField({required String value, FocusNode? focuseNode}) {
    if (value.length == 1) {
      focuseNode?.requestFocus();
    }
  }

  void reSendOTP() async {
    String otpCode = await Function1().sendEmail(signInC.emailC.text);
    if (otpCode == "error") {
      return;
    }
    setState(() {
      signInC.otp_code = otpCode;
      SnackBarNoti("OTP code send", "OTP code is Resent");
    });
  }

  void checkOTP() {
    String check = signInC.otp1.text +
        signInC.otp2.text +
        signInC.otp3.text +
        signInC.otp4.text;
    if (check == signInC.otp_code) {
      onButtonTape(1);
    } else {
      SnackBarError('OTP code is invalid');
    }
  }

  void initAll() {
    signInC.emailC.text = "";
    signInC.newPassC.text = "";
    signInC.rePassC.text = "";
    signInC.otp1.text = "";
    signInC.otp2.text = "";
    signInC.otp3.text = "";
    signInC.otp4.text = "";
  }

  void resetPassword() {}

  Widget build(BuildContext context) {
    List<Widget> _listPages = [
      OTP(),
      ResetPassword(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
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
              (signInC.pages == 0)
                  ? Container(
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
                                image:
                                    AssetImage('assets/img/MountainLogo.png'),
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
                                      image:
                                          AssetImage('assets/img/facebook.png'),
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
                                      image:
                                          AssetImage('assets/img/google.png'),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                children: [
                                  TextFormFieldDesgin(
                                    control: signInC.emailC,
                                    hintText: "Enter your Email",
                                    labelText: "Email",
                                    icon: Icons.person,
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
                                        onTap: () {
                                          setState(() {
                                            signInC.pages = 1;
                                          });
                                        },
                                        child: Text(
                                          'Forgot your password',
                                          style: TextStyle(
                                            color: AppColors.textColor2
                                                .withOpacity(0.5),
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
                                        usersC.SignIn(signInC.emailC.text,
                                            signInC.passC.text);
                                      }),
                                  const SizedBox(height: 7),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Don\'t have account? ',
                                        style: TextStyle(
                                          color: AppColors.textColor2
                                              .withOpacity(0.7),
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
                  : (signInC.pages == 1)
                      ? Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 1.6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
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
                              const SizedBox(height: 5),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      "Input your Email",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormFieldDesgin(
                                      hintText: "Enter your email",
                                      labelText: "Email",
                                      control: signInC.emailC,
                                      icon: Icons.email,
                                    ),
                                    const SizedBox(height: 50),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              signInC.emailC.text = "";
                                              signInC.pages = 0;
                                            });
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
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
                                              sendOTPCode();
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
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 1.6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
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
                              const SizedBox(height: 5),
                              Expanded(
                                child: PageView.builder(
                                  controller: pageController,
                                  itemCount: _listPages.length,
                                  onPageChanged: (value) {
                                    setState(() {});
                                  },
                                  itemBuilder: (context, index) {
                                    return _listPages[index];
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
            ],
          ),
        ],
      ),
    );
  }

  Widget ResetPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'Reset your password',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 20),
          TextFormFieldPassword(
            hintText: 'Enter new pass',
            labelText: 'New pass',
            control: signInC.newPassC,
          ),
          const SizedBox(height: 20),
          TextFormFieldPassword(
            hintText: 'Enter repass',
            labelText: 'Repass',
            control: signInC.rePassC,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    initAll();
                    signInC.pages = 0;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 2, color: AppColors.mainColor),
                  ),
                  child: Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () {
                    String result = UserController().resetPassword(
                        signInC.emailC.text,
                        signInC.newPassC.text,
                        signInC.rePassC.text);
                    if (result.contains("Error")) {
                      SnackBarError(result);
                    } else {
                      SnackBarNoti("Reset Password", result);
                      setState(() {
                        initAll();
                        signInC.pages = 0;
                      });
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor,
                      image: DecorationImage(
                        image: AssetImage('assets/img/button-one.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget OTP() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'Enter OTP code to Reset Password',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: signInC.otp1,
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: AppColors.mainColor, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: AppColors.mainColor, width: 2),
                    ),
                  ),
                  onChanged: (value) {
                    nextField(value: value, focuseNode: signInC.pin2FocusNode);
                  },
                ),
              ),
              Spacer(),
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: signInC.otp2,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  focusNode: signInC.pin2FocusNode,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: AppColors.mainColor, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: AppColors.mainColor, width: 2),
                    ),
                  ),
                  onChanged: (value) {
                    nextField(value: value, focuseNode: signInC.pin3FocusNode);
                  },
                ),
              ),
              Spacer(),
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: signInC.otp3,
                  obscureText: true,
                  focusNode: signInC.pin3FocusNode,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: AppColors.mainColor, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: AppColors.mainColor, width: 2),
                    ),
                  ),
                  onChanged: (value) {
                    nextField(value: value, focuseNode: signInC.pin4FocusNode);
                  },
                ),
              ),
              Spacer(),
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: signInC.otp4,
                  focusNode: signInC.pin4FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: AppColors.mainColor, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: AppColors.mainColor, width: 2),
                    ),
                  ),
                  onChanged: (value) {
                    signInC.pin4FocusNode.unfocus();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    signInC.emailC.text = "";
                    signInC.pages = 0;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 2, color: AppColors.mainColor),
                  ),
                  child: Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () {
                    checkOTP();
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor,
                      image: DecorationImage(
                        image: AssetImage('assets/img/button-one.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
    );
  }
}
