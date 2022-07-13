import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mountain_trip_api/Providers/user_providers.dart';
import 'package:mountain_trip_api/utils/utils.dart';

import '../misc/colors.dart';
import '../models/user.dart';
import '../routes/routName.dart';

class UserController extends GetxController {
  late Rx<User?> _user = Rx<User?>(null);
  User get user => _user.value!;
  @override
  String getNameFromEmail(String email) {
    String result = "";
    int t = 0;
    for (int i = 0; i < email.length; i++) {
      if (email[i] == '@') {
        t = i;
        break;
      }
    }
    result = email.substring(0, t);
    return result;
  }

  void SignIn(String email, String password) {
    if (email != "" && password != "") {
      if (email.contains('@')) {
        try {
          UserProviders().signInFunc(email, password).then((value) {
            if (!value.contains('Error')) {
              var temp = json.decode(value);
              _user.value = User.fromJson(temp);
              update();
              Get.toNamed(RouteName.mainPage);
            } else {
              SnackBarError(value);
            }
          });
        } catch (err) {
          SnackBarError(err.toString());
        }
      } else {
        SnackBarError('Email is not fotmat');
      }
    } else {
      SnackBarError('Field is null');
    }
  }

  void SignUp(String email, String password, String repass, String phone) {
    if (email != "" && password != "" && phone != "") {
      if (email.contains('@')) {
        if (password.length >= 7) {
          if (password != repass) {
            SnackBarError('Repass is incorrect');
          } else {
            try {
              UserProviders().signUpFunc(email, password, phone).then(
                (value) {
                  if (!value.contains('Error')) {
                    var temp = json.decode(value);
                    _user.value = User.fromJson(temp);
                    update();
                    SnackBarNoti("Sign Up", "Create account is success");
                    Get.toNamed(RouteName.mainPage);
                  } else {
                    print(value);
                    SnackBarError(value);
                  }
                },
              );
            } catch (err) {
              SnackBarError(err.toString());
              return;
            }
          }
        } else {
          SnackBarError('Password must be more than 7 characters');
          return;
        }
      } else {
        SnackBarError('Email is not format');
        return;
      }
    } else {
      SnackBarError("Field is null");
      return;
    }
  }

  void SignOut() {
    Get.back();
    _user.value = null;
    update();
  }

  Future<String> EditProfile(
      String id, String name, String email, String pass, String phone) async {
    if (name != "" && email != "" && phone != "") {
      if (email.contains('@')) {
        if (pass.length >= 7) {
          try {
            String change = "";
            await Get.defaultDialog(
                title: "Update Profile",
                middleText: "Do you want update your Profile",
                middleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.white,
                textConfirm: "YES",
                textCancel: "NO",
                confirmTextColor: Colors.white,
                cancelTextColor: AppColors.mainColor,
                buttonColor: AppColors.mainColor,
                titleStyle: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
                onConfirm: () {
                  UserProviders()
                      .EditFunc(id, email, pass, name, phone)
                      .then((value) {
                    print(value);
                    if (!value.contains('Error')) {
                      _user.value?.name = name;
                      _user.value?.email = email;
                      _user.value?.password = pass;
                      _user.value?.phoneNumber = phone;
                      update();
                      SnackBarNoti("Edit User", "Change Profiie is success");
                      change = "yes";
                    } else {
                      SnackBarError('Cann\'t change your profile');
                      change = "no";
                    }
                  });
                });
            return change;
            //Get.reload();
          } catch (err) {
            SnackBarError(err.toString());
            return "no";
          }
        } else {
          SnackBarError('Password must be more than 7 characters');
          return "no";
        }
      } else {
        SnackBarError('Email is not format');
        return "no";
      }
    } else {
      SnackBarError("Field is null");
    }
    return "no";
  }

  Future<String> resetPassword(
      String email, String newPass, String repass) async {
    return "";
  }

  Future<String> changePass(
      String id, String yourPass, String newPass, String rePass) async {
    if (newPass == rePass) {
      if (newPass.length >= 7) {
        try {
          String result = "";
          await Get.defaultDialog(
            title: "Update Password",
            middleText: "Do you want change your Password?",
            middleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.white,
            textConfirm: "YES",
            textCancel: "NO",
            confirmTextColor: Colors.white,
            cancelTextColor: AppColors.mainColor,
            buttonColor: AppColors.mainColor,
            titleStyle: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
            ),
            onConfirm: () {
              UserProviders()
                  .ChangePassFunc(id, newPass, yourPass)
                  .then((value) {
                if (value.contains('Error')) {
                  result = "no";
                  SnackBarError("Your Password is invalid");
                } else {
                  _user.value?.password = newPass;
                  update();
                  Get.reload();
                  result = "yes";
                  SnackBarNoti("Change Password", "Change Password is success");
                }
              });
            },
          );
          return result;
        } catch (err) {
          SnackBarError("Cann't change your Pass");
        }
      } else {
        SnackBarError("New Password muse be more than 7 characters");
        return "no";
      }
    } else {
      SnackBarError("Re Password is invalid");
      return "no";
    }
    return "no";
  }
}
