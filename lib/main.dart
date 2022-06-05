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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiktok clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const WelcomeScreen(),
      getPages: [
        GetPage(name: '/WelcomeScreen', page: () => const WelcomeScreen()),
        GetPage(name: '/HomeScreen', page: () => const HomeScreen()),
      ],
    );
  }
}
