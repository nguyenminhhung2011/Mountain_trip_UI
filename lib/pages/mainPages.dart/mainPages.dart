import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mountain_trip_api/pages/Favorites/FavoritesPages.dart';
import 'package:mountain_trip_api/pages/ProfilePages/profilePages.dart';
import 'package:mountain_trip_api/pages/Search/searchScreen.dart';
import 'package:mountain_trip_api/pages/home_screen_pages.dart';

import '../../misc/colors.dart';
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
    FavoritesPages(),
    SearchPages(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 53,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                color: Colors.black.withOpacity(0.4),
                blurRadius: 20,
              )
            ],
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              ButtonPages(
                  icon: Icons.home,
                  press: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  check: currentIndex == 0),
              Spacer(),
              ButtonPages(
                  icon: Icons.favorite,
                  press: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  check: currentIndex == 1),
              Spacer(),
              ButtonPages(
                  icon: Icons.search,
                  press: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  check: currentIndex == 2),
              Spacer(),
              ButtonPages(
                  icon: Icons.person,
                  press: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  check: currentIndex == 3),
            ],
          ),
        ),
      ),
      body: Pages[currentIndex],
    );
  }
}

class ButtonPages extends StatelessWidget {
  final IconData icon;
  final Function() press;
  final bool check;
  const ButtonPages({
    Key? key,
    required this.icon,
    required this.press,
    required this.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        height: 30,
        decoration: BoxDecoration(
          color: (check) ? AppColors.mainColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        duration: const Duration(milliseconds: 300),
        child: Icon(
          icon,
          color: (check) ? Colors.white : Colors.black54,
          size: 20,
        ),
      ),
    );
  }
}
