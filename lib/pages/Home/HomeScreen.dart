import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mountain_trip_api/misc/colors.dart';

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
      'widget': Container(),
    },
    {
      'index': 2,
      'widget': Container(),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset('assets/icons/sort.svg',
                        height: 19, color: Colors.black54),
                  ),
                  Spacer(),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img/mylogo.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
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
                      'Inspiration',
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
                      'Emotions',
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
          ],
        ),
      ),
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

class DiffCard extends StatelessWidget {
  final String icon;
  final String tittle;
  final Function() press;
  const DiffCard({
    Key? key,
    required this.icon,
    required this.tittle,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: press,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(icon),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            tittle,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class ViewListLocation extends StatelessWidget {
  const ViewListLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            LocationCard(),
            LocationCard(),
            LocationCard(),
            LocationCard(),
          ],
        ),
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  const LocationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 270,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/img/mountain.jpeg'),
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
                AppColors.mainColor,
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
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cascade',
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
                    Text('Canada, Banff',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
