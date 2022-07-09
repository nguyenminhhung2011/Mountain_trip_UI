import 'dart:convert';

import 'package:get/get.dart';
import 'package:mountain_trip_api/Providers/user_providers.dart';
import 'package:mountain_trip_api/utils/utils.dart';

import '../models/user.dart';

class UserController extends GetxController {
  var user = User;

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
            if (value != "") {
              var temp = json.decode(value);
              user = temp[0];
              return;
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
}
