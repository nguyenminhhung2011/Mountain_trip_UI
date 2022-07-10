// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mountain_trip_api/controls/userController.dart';
import 'package:mountain_trip_api/pages/Home/HomeScreen.dart';
import 'package:mountain_trip_api/pages/Welcome_page.dart';
import 'package:mountain_trip_api/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userC = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Sen",
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black12,
              fontSize: 18,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      getPages: AppPages.pages,
    );
  }
}
