import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mountain_trip_api/pages/tourGuide/tourGuideProfile.dart';
import 'package:mountain_trip_api/pages/tourGuide/widgets/CardView.dart';
import 'package:mountain_trip_api/pages/tourGuide/widgets/EmployyCard.dart';

import '../../misc/colors.dart';
import '../../widgets/ratingBar.dart';

class ChooseTourGuideScreen extends StatefulWidget {
  const ChooseTourGuideScreen({Key? key}) : super(key: key);

  @override
  State<ChooseTourGuideScreen> createState() => _ChooseTourGuideScreenState();
}

class _ChooseTourGuideScreenState extends State<ChooseTourGuideScreen> {
  String dropdownValue = "Card View";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38.withOpacity(0.4),
                        offset: Offset(2, 3),
                        blurRadius: 3)
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/img/pngwing.com.png'),
                          height: MediaQuery.of(context).size.height / 5 - 20,
                        ),
                        // const SizedBox(width: 5),
                        Text(
                          'Employee',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 5 - 25,
                child: Container(
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
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Top Employee',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.bar_chart_rounded,
                  color: AppColors.mainColor,
                  size: 30,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TopEmployCard(
                      isTop: 1,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'List Employees',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(
                    Icons.people,
                    size: 20,
                    color: AppColors.mainColor,
                  ),
                  elevation: 0,
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w700,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  underline: Container(
                    height: 2,
                    color: AppColors.mainColor,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Card View', 'List View']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          //const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: (dropdownValue == "List View")
                    ? Column(
                        children: [
                          EmployyCard(checkActive: true),
                          EmployyCard(checkActive: false),
                          EmployyCard(checkActive: true),
                          EmployyCard(checkActive: true),
                          EmployyCard(checkActive: true),
                          EmployyCard(checkActive: true),
                        ],
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        child: MasonryGridView.count(
                          crossAxisCount: 2,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 10),
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return CardView(
                                checkActive: (index % 2 == 0) ? true : false);
                          },
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopEmployCard extends StatelessWidget {
  final double isTop;
  final Function() press;
  const TopEmployCard({
    Key? key,
    required this.isTop,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 4 * isTop,
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
              width: MediaQuery.of(context).size.width / 5.5 * isTop,
              height: MediaQuery.of(context).size.width / 5.5 * isTop,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (isTop == 1) ? AppColors.starColor : AppColors.mainColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/pngwing.com.png'),
                  //he: MediaQuery.of(context).size.width / 5,
                ),
              ),
            ),
            Text(
              'Stephen Cury',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15 * isTop,
              ),
            ),
            Text(
              'Tour Guide',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 2 * isTop,
            ),
            Rating(
              rating: 4.5,
              icon: Icon(Icons.star, color: Colors.amber),
              itemCount: 5,
              itemSize: 11 * isTop,
            ),
          ],
        ),
      ),
    );
  }
}
