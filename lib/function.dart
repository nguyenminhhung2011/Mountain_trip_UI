import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Function1 {
  Future sendEmail(String email) async {
    const servicedId = "service_dt1vsrn";
    const templatedId = "template_minhhung2011";
    const userId = "uOFqprvD7RNb1vEWD";
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "service_id": servicedId,
          "template_id  ": templatedId,
          "user_id": userId,
          "template_params": {
            "name": "Mountain trip Apps",
            "subject": "Test Subject",
            "message": "OTP is 2011",
            "user_email": email,
            "email_to": email,
            "name_send": "Hung"
          }
        }));
    print("send");
    print(response.body);
    return response.statusCode;
  }
}
//