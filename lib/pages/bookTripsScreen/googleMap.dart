import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mountain_trip_api/pages/HotelScreen/HotelScreen.dart';
import 'package:mountain_trip_api/pages/bookTripsScreen/widgets/hotelCard.dart';

import '../../misc/colors.dart';
import '../tourGuide/chooseTourGuideScreen.dart';

class GoogleMaps extends StatefulWidget {
  final bool checkMode;
  const GoogleMaps({Key? key, required this.checkMode}) : super(key: key);

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  // double long = 49.5;
  // double lat = -0.09;
  List<Marker> location = [];
  List<int> listTab = [0, 1, 2, 3, 4, 5];
  PageController pageController = PageController(
    viewportFraction: 0.85,
    initialPage: 0,
  );
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              zoom: 5.0,
              onTap: (p, l) {
                setState(() {
                  //print(point);
                });
              },
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(
                markers: [],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 34.0),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,
                          color: AppColors.mainColor),
                    ),
                    Expanded(
                      child: Card(
                        child: TextField(
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16.0),
                            hintText: "Search Location",
                            prefixIcon: Icon(Icons.location_on_outlined,
                                color: AppColors.mainColor),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemCount: 6,
                    itemBuilder: (contex, index) {
                      //double scale = max(viewportFr)
                      if (index == 5) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.mainColor.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Show More..',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: HotelCard(press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HotelScreen(checkMode: widget.checkMode),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listTab
                      .map(
                        (e) => buildIndicator(
                          currentIndex == e,
                          MediaQuery.of(context).size,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
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
          boxShadow: [
            BoxShadow(
                color: Colors.black38.withOpacity(0.1),
                offset: Offset(2, 3),
                blurRadius: 3)
          ]),
    );
  }
}
