import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/Favorites/FavoritesPages.dart';
import '../pages/Home/HomeScreen.dart';
import '../pages/ProfilePages/profilePages.dart';
import '../pages/Search/searchScreen.dart';

class MainPageC extends GetxController {
  late int currentIndex = 0;
  late bool checkMode = true;
  late List<Widget> Pages = [
    HomeScreen(checkMode: checkMode),
    FavoritesPages(checkMode: checkMode),
    SearchPages(checkMode: checkMode),
    ProfileScreen(checkMode: checkMode),
  ];

  void onClose() {
    currentIndex = 0;
    checkMode = true;
    super.onClose();
  }
}
