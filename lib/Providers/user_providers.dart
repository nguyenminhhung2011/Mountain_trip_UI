import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;
import 'package:mountain_trip_api/data/link_api.dart';

class UserProviders extends GetConnect {
  Future<String> signInFunc(String email, String password) async {
    print('Sign In Function is called');
    var client = http.Client();
    var uri = Uri.parse(linkApi.signInLink + email + "/" + password);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return "";
  }

  Future<String> signUpFunc(
      String email, String password, String photoPath) async {
    print('Sign Up Function is called');
    var client = http.Client();
    var uri = Uri.parse(
        linkApi.signUpLink + email + "/" + password + "/" + photoPath);
    print(linkApi.signUpLink + email + "/" + password + "/" + photoPath);
    var response = await client.post(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return "";
  }
}
