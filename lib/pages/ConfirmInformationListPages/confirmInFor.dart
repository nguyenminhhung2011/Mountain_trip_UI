import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../misc/colors.dart';

class ConFirmScreen extends StatefulWidget {
  const ConFirmScreen({Key? key}) : super(key: key);

  @override
  State<ConFirmScreen> createState() => _ConFirmScreenState();
}

class _ConFirmScreenState extends State<ConFirmScreen> {
  double _width1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _width1 = (_width1 == 0) ? 80 : 0;
          });
        },
        child: Icon(Icons.person),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Confirm Information',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on_sharp, color: AppColors.mainColor),
              Stack(
                children: [
                  Container(
                    height: 0.5,
                    width: 80,
                    color: Colors.grey,
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    height: 0.5,
                    width: _width1,
                    color: AppColors.mainColor,
                  )
                ],
              ),
              Icon(Icons.payment, color: AppColors.mainColor),
              Stack(
                children: [
                  Container(
                    height: 0.5,
                    width: 80,
                    color: Colors.grey,
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    height: 0.5,
                    width: 0,
                    color: AppColors.mainColor,
                  )
                ],
              ),
              Icon(Icons.check_circle, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 40),
          Line(),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Checking Information',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InformationROw(
                      icon: Icon(Icons.tour, color: AppColors.mainColor),
                      header: "Name of Mountain",
                      title: "Everes Mountain"),
                  const SizedBox(height: 10),
                  InformationROw(
                      icon: Icon(Icons.location_on, color: AppColors.mainColor),
                      header: "Location of Mountain",
                      title: "California,America"),
                  const SizedBox(height: 10),
                  InformationROw(
                      icon: Icon(Icons.star, color: AppColors.mainColor),
                      header: "Level",
                      title: "Hard"),
                  const SizedBox(height: 20),
                  Line(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Check personal information',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InformationROw(
                      icon: Icon(Icons.person, color: AppColors.mainColor),
                      header: "Name",
                      title: "Nguyen Minh Hung"),
                  const SizedBox(height: 10),
                  InformationROw(
                      icon: Icon(Icons.phone, color: AppColors.mainColor),
                      header: "Phone Number",
                      title: "0935703991"),
                  const SizedBox(height: 10),
                  InformationROw(
                      icon: Icon(Icons.people, color: AppColors.mainColor),
                      header: "No Person in Tour",
                      title: "5"),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    //height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date of Trip',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "20-11-2002",
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.calendar_month,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        //  padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(width: 2, color: AppColors.mainColor),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.gps_fixed,
                          color: AppColors.mainColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 65,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38.withOpacity(0.4),
                                    offset: Offset(2, 3),
                                    blurRadius: 4)
                              ],
                            ),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//Check personal information
class InformationROw extends StatelessWidget {
  final String header;
  final String title;
  final Widget icon;
  const InformationROw({
    Key? key,
    required this.header,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 10),
        Text(
          header,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0.5,
      decoration: BoxDecoration(
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
              color: Colors.black38.withOpacity(0.4),
              offset: Offset(2, 3),
              blurRadius: 4)
        ],
      ),
    );
  }
}
