import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mountain_trip_api/pages/Home/HomeScreen.dart';
import 'package:mountain_trip_api/pages/HotelScreen/HotelScreen.dart';

import '../../misc/colors.dart';
import '../../widgets/ratingBar.dart';
import '../bookTripsScreen/googleMap.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Row(
          children: [
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width - 80,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38.withOpacity(0.4),
                        offset: Offset(2, 3),
                        blurRadius: 3)
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.mainColor,
                    ),
                    const SizedBox(width: 5),
                    Container(
                      width: MediaQuery.of(context).size.width - 150,
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search here',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GoogleMaps(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.map,
                    color: AppColors.mainColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Find Hotel in map',
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PopulaHotelCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopulaHotelCard extends StatelessWidget {
  const PopulaHotelCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HotelScreen(),
            ),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black38.withOpacity(0.1),
                offset: Offset(-2, 2),
                blurRadius: 3,
              ),
              BoxShadow(
                color: Colors.black38.withOpacity(0.1),
                offset: Offset(2, -2),
                blurRadius: 3,
              )
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 220 * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://pix10.agoda.net/hotelImages/280516/-1/cafcc95a1200438d463f6fbd37c1303f.jpg?ca=10&ce=1&s=1024x768',
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38.withOpacity(0.1),
                      offset: Offset(-2, 2),
                      blurRadius: 3,
                    ),
                    BoxShadow(
                      color: Colors.black38.withOpacity(0.1),
                      offset: Offset(2, -2),
                      blurRadius: 3,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cascade',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_sharp,
                                color: AppColors.mainColor, size: 15),
                            const SizedBox(width: 4),
                            Text(
                              'Canada, Banff',
                              style: TextStyle(color: Colors.black),
                            ),
                            Spacer(),
                            Rating(
                              rating: 3.5,
                              icon: Icon(Icons.star, color: Colors.amber),
                              itemCount: 5,
                              itemSize: 13,
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
