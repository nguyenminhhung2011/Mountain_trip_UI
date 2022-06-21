import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mountain_trip_api/misc/colors.dart';
import 'package:mountain_trip_api/pages/Cart/cartMain.dart';
import 'package:mountain_trip_api/pages/Home/LevelScreen.dart';
import 'package:mountain_trip_api/pages/Home/MountainWithSport.dart';
import 'package:mountain_trip_api/pages/Home/widgets/DiffCard.dart';
import 'package:mountain_trip_api/pages/Home/widgets/LocationCard.dart';
import 'package:mountain_trip_api/pages/Home/widgets/PopularPlacesCard.dart';
import 'package:mountain_trip_api/pages/Home/widgets/ViewHotel.dart';
import 'package:mountain_trip_api/pages/Home/widgets/ViewListLocation.dart';
import 'package:mountain_trip_api/pages/HotelScreen/HotelScreen.dart';
import 'package:mountain_trip_api/pages/HotelScreen/allHotels.dart';
import 'package:mountain_trip_api/widgets/ratingBar.dart';

import '../../data/fake_data.dart';
import '../tourGuide/chooseTourGuideScreen.dart';
import '../tourGuide/tourGuideProfile.dart';

class HomeScreen extends StatefulWidget {
  final bool checkMode;
  const HomeScreen({Key? key, required this.checkMode}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectTabIndex = 0;

  List<Map<String, dynamic>> _listTab = [
    {
      'index': 0,
      'widget': ViewListLocation(),
    },
    {
      'index': 1,
      'widget': ViewPoplularPlaces(),
    },
    {
      'index': 2,
      'widget': ViewHotel(),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (!widget.checkMode) ? Colors.black : Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 10),
        Container(
          color: Colors.transparent,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: SvgPicture.asset('assets/icons/sort.svg',
                    height: 19,
                    color: (widget.checkMode) ? Colors.black : Colors.white),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartMain(),
                    ),
                  );
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset('assets/icons/cart.svg'),
                    Positioned(
                      top: -10,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mainColor,
                        ),
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Discover',
                    style: TextStyle(
                      color: (widget.checkMode) ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 35,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectTabIndex = 0;
                          });
                        },
                        child: Text(
                          'Places',
                          style: TextStyle(
                            color: (selectTabIndex == 0)
                                ? (widget.checkMode)
                                    ? Colors.black
                                    : Colors.white
                                : Colors.grey.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectTabIndex = 1;
                          });
                        },
                        child: Text(
                          'Popular places',
                          style: TextStyle(
                            color: (selectTabIndex == 1)
                                ? (widget.checkMode)
                                    ? Colors.black
                                    : Colors.white
                                : Colors.grey.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectTabIndex = 2;
                          });
                        },
                        child: Text(
                          'Hotels',
                          style: TextStyle(
                            color: (selectTabIndex == 2)
                                ? (widget.checkMode)
                                    ? Colors.black
                                    : Colors.white
                                : Colors.grey.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                _listTab[selectTabIndex]['widget'],
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: _listTab.map((e) {
                      return buildIndicator(e['index'] == selectTabIndex,
                          MediaQuery.of(context).size);
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Explore more',
                        style: TextStyle(
                          color:
                              (widget.checkMode) ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        DiffCard(
                            icon: 'assets/img/kayaking.png',
                            tittle: 'Kayaking',
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MountainSports(sport: 0),
                                ),
                              );
                            },
                            checkMode: widget.checkMode),
                        DiffCard(
                            icon: 'assets/img/snorkling.png',
                            tittle: 'Snorkling',
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MountainSports(sport: 1),
                                ),
                              );
                            },
                            checkMode: widget.checkMode),
                        DiffCard(
                            icon: 'assets/img/balloning.png',
                            tittle: 'Balloning',
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MountainSports(sport: 2),
                                ),
                              );
                            },
                            checkMode: widget.checkMode),
                        DiffCard(
                            icon: 'assets/img/hiking.png',
                            tittle: 'Hiking',
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MountainSports(sport: 3),
                                ),
                              );
                            },
                            checkMode: widget.checkMode)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      color: (widget.checkMode) ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(
                                  level: 1,
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width / 2.7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/img/mountain.jpeg'),
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width / 2.7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black26,
                                      AppColors.mainColor,
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width / 2.7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        Rating(
                                          rating: 1,
                                          icon: Icon(Icons.star,
                                              color: Colors.amber),
                                          itemCount: 3,
                                          itemSize: 15,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Easy',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        Text(
                                          '< 1000m',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(
                                  level: 2,
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width / 2.7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/img/mountain.jpeg'),
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width / 2.7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black26,
                                      AppColors.starColor,
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width / 2.7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        Rating(
                                          rating: 2.0,
                                          icon: Icon(Icons.star,
                                              color: Colors.amber),
                                          itemCount: 3,
                                          itemSize: 15,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Medium',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        Text(
                                          '2000m - 3000m',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(
                                  level: 3,
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width / 2.7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/img/mountain.jpeg'),
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width / 2.7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black26,
                                      Colors.red,
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width / 2.7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        Rating(
                                          rating: 3,
                                          icon: Icon(Icons.star,
                                              color: Colors.amber),
                                          itemCount: 3,
                                          itemSize: 15,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Hard',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        Text(
                                          '> 3000m',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Tour Guide',
                        style: TextStyle(
                          color:
                              (!widget.checkMode) ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChooseTourGuideScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'See more',
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TopEmployCard(
                            isTop: 0.8,
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TourGuideProfile(),
                                ),
                              );
                            }),
                        TopEmployCard(isTop: 0.8, press: () {}),
                        TopEmployCard(isTop: 0.8, press: () {}),
                        TopEmployCard(isTop: 0.8, press: () {}),
                        TopEmployCard(isTop: 0.8, press: () {}),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 50 : 20,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          //container with border
          color: isActive
              ? AppColors.mainColor
              : AppColors.mainColor.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
          ]),
    );
  }
}

class ViewPoplularPlaces extends StatelessWidget {
  const ViewPoplularPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PopularPlacesCard(),
            PopularPlacesCard(),
            PopularPlacesCard(),
            PopularPlacesCard()
          ],
        ),
      ),
    );
  }
}
