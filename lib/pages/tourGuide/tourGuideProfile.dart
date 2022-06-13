import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mountain_trip_api/pages/tourGuide/chatScreen.dart';
import 'package:mountain_trip_api/pages/tourGuide/widgets/ActiveOrNot.dart';

import '../../data/fake_data.dart';
import '../../misc/colors.dart';

class TourGuideProfile extends StatefulWidget {
  const TourGuideProfile({Key? key}) : super(key: key);

  @override
  State<TourGuideProfile> createState() => _TourGuideProfileState();
}

class _TourGuideProfileState extends State<TourGuideProfile> {
  double p = 1;
  bool checkHire = false;
  final _controller = PageController(viewportFraction: 0.85);
  int _curentPage = 0;
  @override
  void initState() {
    super.initState();
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose him as a guide',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Success',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05 * p),
                  AnimatedContainer(
                    height: MediaQuery.of(context).size.height * 0.45 * p,
                    width: MediaQuery.of(context).size.width * 0.75 * p,
                    decoration: BoxDecoration(
                        // color: Colors.red,
                        // image: DecorationImage(

                        // ),
                        ),
                    duration: const Duration(seconds: 1),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/img/pngwing.com.png'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.mainColor.withOpacity(0.2),
                  Colors.white,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38.withOpacity(0.5),
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
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        setState(() {
                          if (checkHire == false) {
                            showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color: AppColors.mainColor,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/img/pngwing.com.png'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Stephen cury',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                'Tour Guide',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Choose Options',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.trip_origin,
                                            color: AppColors.mainColor,
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          checkHire = !checkHire;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:
                              (checkHire) ? AppColors.mainColor : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38.withOpacity(0.5),
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
                        child: Row(
                          children: [
                            Text(
                              (checkHire) ? "Cancle" : 'Hire a Guide',
                              style: TextStyle(
                                color:
                                    (checkHire) ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        setState(() {
                          p = (p == 1) ? 0.895 : 1;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38.withOpacity(0.5),
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
                        child: Icon(
                          (p == 1)
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                //const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Stephen\n Cury',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(height: 150 * p),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38.withOpacity(0.5),
                                offset: Offset(-2, 2),
                                blurRadius: 3,
                              ),
                              BoxShadow(
                                color: Colors.black38.withOpacity(0.1),
                                offset: Offset(2, -2),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.bookmarks,
                                color: AppColors.mainColor,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              ActiveOrNot(checkActive: true),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height:
                        MediaQuery.of(context).size.height * 0.62 * (1 / (p)),
                    width: double.infinity,
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemCount: FakeData().listButtonInProfile.length,
                      itemBuilder: (context, index) {
                        if (index == 1) {
                          return SizedBox(height: 70);
                        }
                        return InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            switch (FakeData().listButtonInProfile[index]
                                ["type"]) {
                              case 5:
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatScreen(),
                                    ),
                                  );
                                }
                                break;
                            }
                          },
                          child: Container(
                            //height: 210,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: FakeData().listButtonInProfile[index]
                                  ["color"],
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
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                FakeData().listButtonInProfile[index]["title"],
                                //Spacer(),
                                const SizedBox(height: 20),
                                FakeData().listButtonInProfile[index]["data"],
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _pageImages() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 5,
      ),
      child: Container(
          decoration: BoxDecoration(
        color: AppColors.mainColor,
      )),
    );
  }
}
