import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mountain_trip_api/pages/BarItemPages/BarItemPages.dart';
import 'package:mountain_trip_api/pages/ProfilePages/profilePages.dart';
import 'package:mountain_trip_api/pages/Search/searchScreen.dart';
import 'package:mountain_trip_api/pages/home_screen_pages.dart';

import '../Home/HomeScreen.dart';

class MainPagesScreen extends StatefulWidget {
  const MainPagesScreen({Key? key}) : super(key: key);

  @override
  State<MainPagesScreen> createState() => _MainPagesScreenState();
}

class _MainPagesScreenState extends State<MainPagesScreen> {
  int currentIndex = 0;
  List<Widget> Pages = [
    HomeScreen(),
    BarItemPages(),
    SearchPages(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color.fromARGB(255, 92, 71, 71),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        elevation: 0,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: (currentIndex == 0)
                    ? Colors.black54
                    : Colors.grey.withOpacity(0.5),
              ),
              label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
      body: Pages[currentIndex],
    );
  }
}
