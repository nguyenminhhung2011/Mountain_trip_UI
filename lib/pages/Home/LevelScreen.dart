import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mountain_trip_api/pages/Home/widgets/PlacesWithLevel.dart';

import '../../data/fake_data.dart';
import '../../misc/colors.dart';
import '../../widgets/ratingBar.dart';
import '../DetailsPages/detailPages.dart';

class LevelScreen extends StatelessWidget {
  final int level; // 0: easy , 1: Medium , 2: Hard
  final bool checkMode;
  const LevelScreen({Key? key, required this.level, required this.checkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (checkMode) ? Colors.white : Colors.black,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/img/mountain.jpeg'),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: (level == 1)
                          ? FakeData().EasyColor
                          : (level == 2)
                              ? FakeData().MediumColor
                              : FakeData().HardColor),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Rating(
                              rating: level.toDouble(),
                              icon: Icon(Icons.star, color: Colors.amber),
                              itemCount: 3,
                              itemSize: 22,
                            ),
                            Spacer(),
                            Text(
                              (level == 1)
                                  ? 'Easy'
                                  : (level == 2)
                                      ? 'Medium'
                                      : 'Hard',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(
                              Icons.height,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              (level == 1)
                                  ? 'Height: < 1000'
                                  : (level == 2)
                                      ? 'Height: 2000 - 3000'
                                      : 'Height: > 3000',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '40 mountain with level',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Popular places',
              style: TextStyle(
                color: (checkMode) ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: FakeData()
                    .listCart
                    .map(
                      (e) => PlacesWithLevel(
                        checkMode: checkMode,
                        height: 2100,
                        name: e["name"],
                        location: 'Thi xa An Khe, Viet Nam',
                        imagePath: e['image'],
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
