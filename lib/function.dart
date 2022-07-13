import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Function1 {
  Future<String> sendEmail(String email) async {
    const servicedId = "service_dt1vsrn";
    const templatedId = "template_wyhd1kn";
    const userId = "uOFqprvD7RNb1vEWD";
    var rand = Random();
    int otpCode = rand.nextInt(8999) + 1000;

    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    try {
      final response = await http.post(url,
          headers: {
            'origin': 'http://localhost',
            'Content-Type': 'application/json',
          },
          body: json.encode({
            "service_id": servicedId,
            "template_id": templatedId,
            "user_id": userId,
            "template_params": {
              "subject": "Create Account",
              "user_email": email,
              "email_to": email,
              "name_send": "Mountain trip App",
              "message": otpCode,
            }
          }));
      if (response.statusCode != 200) {
        return "error";
      }
      return otpCode.toString();
    } catch (err) {
      print(err.toString());
    }
    return "error";
  }

  Future<String> sendEmail_forgotPassword(String email) async {
    const servicedId = "service_dt1vsrn";
    const templatedId = "template_wyhd1kn";
    const userId = "uOFqprvD7RNb1vEWD";
    var rand = Random();
    int otpCode = rand.nextInt(8999) + 1000;
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    try {
      final response = await http.post(url,
          headers: {
            'origin': 'http://localhost',
            'Content-Type': 'application/json',
          },
          body: json.encode({
            "service_id": servicedId,
            "template_id": templatedId,
            "user_id": userId,
            "template_params": {
              "subject": "Forgot password",
              "user_email": email,
              "email_to": email,
              "name_send": "Mountain trip App",
              "message": otpCode,
            }
          }));
      if (response.statusCode != 200) {
        return "error";
      }
      return otpCode.toString();
    } catch (err) {
      print(err.toString());
    }
    return "error";
  }
}
//