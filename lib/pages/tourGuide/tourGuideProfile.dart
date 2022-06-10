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
  @override
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
                            if (FakeData().listButtonInProfile[index]["type"] ==
                                5) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(),
                                ),
                              );
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
}
