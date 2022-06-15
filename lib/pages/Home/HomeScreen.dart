import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mountain_trip_api/misc/colors.dart';
import 'package:mountain_trip_api/pages/Cart/cartMain.dart';
import 'package:mountain_trip_api/pages/Home/widgets/DiffCard.dart';
import 'package:mountain_trip_api/pages/Home/widgets/LocationCard.dart';
import 'package:mountain_trip_api/pages/Home/widgets/PopularPlacesCard.dart';
import 'package:mountain_trip_api/pages/Home/widgets/ViewListLocation.dart';
import 'package:mountain_trip_api/pages/HotelScreen/HotelScreen.dart';
import 'package:mountain_trip_api/pages/HotelScreen/allHotels.dart';
import 'package:mountain_trip_api/widgets/ratingBar.dart';

import '../tourGuide/chooseTourGuideScreen.dart';
import '../tourGuide/tourGuideProfile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 10),
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset('assets/icons/sort.svg',
                    height: 19, color: Colors.black54),
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
                      color: Colors.black,
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
                                ? Colors.black
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
                                ? Colors.black
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
                                ? Colors.black
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
                          color: Colors.black,
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
                          press: () {},
                        ),
                        DiffCard(
                          icon: 'assets/img/snorkling.png',
                          tittle: 'Snorkling',
                          press: () {},
                        ),
                        DiffCard(
                          icon: 'assets/img/balloning.png',
                          tittle: 'Balloning',
                          press: () {},
                        ),
                        DiffCard(
                          icon: 'assets/img/hiking.png',
                          tittle: 'Hiking',
                          press: () {},
                        )
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
                      color: Colors.black,
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
                          onTap: () {},
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
                          onTap: () {},
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
                          onTap: () {},
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
                          color: Colors.black,
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

class ViewHotel extends StatelessWidget {
  const ViewHotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllHotels(),
                ),
              );
            },
            child: Text(
              'See All Hotel',
              style: TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HotelsCard(),
                HotelsCard(),
                HotelsCard(),
                HotelsCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HotelsCard extends StatelessWidget {
  const HotelsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelScreen(),
          ),
        );
      },
      child: Container(
        child: Stack(
          children: [
            Container(
              height: 270,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://pix10.agoda.net/hotelImages/280516/-1/cafcc95a1200438d463f6fbd37c1303f.jpg?ca=10&ce=1&s=1024x768',
                  ),
                ),
              ),
            ),
            Container(
              height: 270,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black26,
                    Colors.black26,
                    AppColors.starColor,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 270,
                width: 180,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 51,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 13,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '3.5',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Huong Binh',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_sharp,
                            color: Colors.white, size: 15),
                        const SizedBox(width: 4),
                        Text('An Khe, Banff',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
