// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mountain_trip_api/pages/Home/HomeScreen.dart';
import 'package:mountain_trip_api/pages/home_screen_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // fontFamily: "Muli",
        fontFamily: "Sen",

        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          // ignore: deprecated_member_use
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
      title: 'Mountain trip',
      home: const WelcomeScreen(),
    );
    //  GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Tiktok clone',
    //   theme: ThemeData.dark().copyWith(
    //     scaffoldBackgroundColor: Colors.black,
    //   ),
    //   home: const WelcomeScreen(),
    //   getPages: [
    //     GetPage(name: '/WelcomeScreen', page: () => const WelcomeScreen()),
    //     GetPage(name: '/HomeScreen', page: () => const HomeScreen()),
    //   ],
    // );
  }
}
