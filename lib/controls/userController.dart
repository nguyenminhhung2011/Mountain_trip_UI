import 'dart:convert';

import 'package:get/get.dart';
import 'package:mountain_trip_api/Providers/user_providers.dart';
import 'package:mountain_trip_api/utils/utils.dart';

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
}
