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
              SnackBarError('Email or password is valid');
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

  void SignUp(String email, String password, String repass, String photoPath) {
    if (email != "" && password != "") {
      if (email.contains('@')) {
        if (password.length >= 7) {
          if (password != repass) {
            SnackBarError('Repass is incorrect');
          } else {
            try {
              UserProviders().signUpFunc(email, password, photoPath).then(
                (value) {
                  if (!value.contains('Error')) {
                    var temp = json.decode(value);
                    _user.value = User.fromJson(temp);
                    update();
                    SnackBarNoti("Sign Up", "Create account is success");
                  } else {
                    SnackBarError('Email or password is valid');
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

  Future<void> EditProfile(
      String id, String name, String email, String pass, String phone) async {
    if (name != "" && email != "" && pass != "" && phone != "") {
      if (email.contains('@')) {
        if (pass.length >= 7) {
          try {
            await Get.defaultDialog(
                title: "Update Profile",
                middleText: "Do you want update your Profile?",
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
                      Get.reload();
                    } else {
                      SnackBarError('Cann\'t change your profile');
                    }
                  });
                });
          } catch (err) {
            SnackBarError(err.toString());
            return;
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
    }
  }

  Future<void> changePass(String id, String newPass) async {
    if (newPass.length >= 7) {
      try {
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
              UserProviders().ChangePassFunc(id, newPass).then((value) {
                _user.value?.password = newPass;
                update();
                Get.reload();
              });
              return;
            });
      } catch (err) {
        SnackBarError(err.toString());
      }
    } else {
      SnackBarError("New Password muse be more than 7 characters");
      return;
    }
  }
}
