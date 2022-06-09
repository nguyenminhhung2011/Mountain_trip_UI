import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mountain_trip_api/misc/colors.dart';
import 'package:mountain_trip_api/pages/DetailsPages/evaluate.dart';
import 'package:mountain_trip_api/pages/DetailsPages/widgets/NumberPeopleInGroup.dart';
import 'package:mountain_trip_api/widgets/responsiveButton.dart';

import '../../widgets/ratingBar.dart';
import '../bookTripsScreen/Calender.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int selectPeople = 1;
  double selectPeopleDouble = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/img/mountain.jpeg',
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset('assets/icons/sort.svg',
                          height: 19, color: Colors.white),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          Icon(Icons.more_vert, size: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Text(
                              'Yosemite',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '\$250',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.location_on_sharp,
                                color: AppColors.mainColor, size: 15),
                            const SizedBox(width: 4),
                            Text(
                              'Usa, California',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RatingBar.builder(
                              initialRating: 3.5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            const SizedBox(width: 7),
                            Text(
                              '(3.5)',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Evaluate(),
                                  ),
                                );
                              },
                              child: SvgPicture.asset(
                                'assets/icons/chat.svg',
                                color: AppColors.mainColor,
                                height: 20,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Text(
                              'People',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.people, color: AppColors.mainColor),
                          ],
                        ),
                        Text(
                          'Number of people in your group',
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              NumberPeopleInGroup(
                                  no: 1,
                                  press: () {
                                    setState(() {
                                      selectPeople = 1;
                                    });
                                  },
                                  selected: selectPeople == 1),
                              NumberPeopleInGroup(
                                  no: 2,
                                  press: () {
                                    setState(() {
                                      selectPeople = 2;
                                    });
                                  },
                                  selected: selectPeople == 2),
                              NumberPeopleInGroup(
                                  no: 3,
                                  press: () {
                                    setState(() {
                                      selectPeople = 3;
                                    });
                                  },
                                  selected: selectPeople == 3),
                              NumberPeopleInGroup(
                                  no: 4,
                                  press: () {
                                    setState(() {
                                      selectPeople = 4;
                                    });
                                  },
                                  selected: selectPeople == 4),
                              NumberPeopleInGroup(
                                  no: 5,
                                  press: () {
                                    setState(() {
                                      selectPeople = 5;
                                    });
                                  },
                                  selected: selectPeople == 5),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  double.parse(
                                                          (selectPeopleDouble)
                                                              .toStringAsFixed(
                                                                  0))
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: AppColors.mainColor,
                                                    fontSize: 80,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                Icon(
                                                  Icons.people,
                                                  color: AppColors.mainColor,
                                                  size: 40,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Slider(
                                              value: selectPeopleDouble,
                                              min: 1,
                                              max: 10,
                                              divisions: 95,
                                              activeColor: AppColors.mainColor,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectPeopleDouble = value;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColors.mainColor),
                                  child: Text(
                                    'More',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Description',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Yosemite National Park is located in central Sierra Nevada in Us state of California. It is located near the the wild protected areas.',
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Level of difficult',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Rating(
                          rating: 2.0,
                          icon: Icon(Icons.star, color: Colors.amber),
                          itemCount: 3,
                          itemSize: 20,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 2,
                                    color: AppColors.mainColor,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38.withOpacity(0.4),
                                        offset: Offset(2, 3),
                                        blurRadius: 3)
                                  ],
                                ),
                                child: Icon(
                                  Icons.favorite_outline,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BookTrips(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  alignment: Alignment.center,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Colors.black38.withOpacity(0.4),
                                          offset: Offset(2, 3),
                                          blurRadius: 3)
                                    ],
                                  ),
                                  child: Row(children: [
                                    const SizedBox(width: 20),
                                    Text(
                                      'Book Trip Now',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Spacer(),
                                    Image(
                                      image: AssetImage(
                                          'assets/img/button-one.png'),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
