import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Function1 {
  Future sendEmail(String email) async {
    const servicedId = "service_dt1vsrn";
    const templatedId = "template_wyhd1kn";
    const userId = "uOFqprvD7RNb1vEWD";
    var rand = Random();
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
              "subject": "OTP code",
              "user_email": email,
              "email_to": email,
              "name_send": "Mountain trip App",
              "message": rand.nextInt(9999),
            }
          }));
      print(response.body);
    } catch (err) {
      print(err.toString());
    }
    print("send");
    return;
  }
}
//