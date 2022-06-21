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
  bool checkMode = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> Pages = [
      HomeScreen(checkMode: checkMode),
      FavoritesPages(checkMode: checkMode),
      SearchPages(checkMode: checkMode),
      ProfileScreen(checkMode: checkMode),
    ];
    return Scaffold(
      extendBody: true,
      drawer: new Drawer(
          // Thanh menu
          child: Container(
        color: AppColors.mainColor.withOpacity(0.2),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 40),
              child: Text(
                'Change The Interface',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2, 3),
                          blurRadius: 3)
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: AppColors.mainColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Change Language',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  setState(() {
                    checkMode = !checkMode;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2, 3),
                          blurRadius: 3)
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        (!checkMode) ? Icons.brightness_4 : Icons.brightness_2,
                        color: AppColors.mainColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        (!checkMode) ? 'Light Mode' : 'Dark Mode',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 53,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          decoration: BoxDecoration(
            color: (checkMode)
                ? Colors.white
                : Color.fromARGB(255, 50, 48, 48).withOpacity(0.9),
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
                check: currentIndex == 0,
                checkMode: checkMode,
              ),
              Spacer(),
              ButtonPages(
                  icon: Icons.favorite,
                  press: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  checkMode: checkMode,
                  check: currentIndex == 1),
              Spacer(),
              ButtonPages(
                  icon: Icons.search,
                  press: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  checkMode: checkMode,
                  check: currentIndex == 2),
              Spacer(),
              ButtonPages(
                  icon: Icons.person,
                  press: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  checkMode: checkMode,
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
  final bool checkMode;
  const ButtonPages({
    Key? key,
    required this.icon,
    required this.press,
    required this.check,
    required this.checkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        height: 30,
        decoration: BoxDecoration(
          color: (check) ? AppColors.mainColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        duration: const Duration(milliseconds: 300),
        child: Icon(
          icon,
          color: (check)
              ? (checkMode)
                  ? Colors.white
                  : Color.fromARGB(255, 50, 48, 48).withOpacity(0.9)
              : (checkMode)
                  ? Colors.black54
                  : Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}
