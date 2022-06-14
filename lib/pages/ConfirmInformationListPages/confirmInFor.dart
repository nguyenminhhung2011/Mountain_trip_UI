import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mountain_trip_api/pages/ConfirmInformationListPages/ConfirmInformation.dart';
import 'package:mountain_trip_api/pages/ConfirmInformationListPages/Payement..dart';
import 'package:mountain_trip_api/pages/ConfirmInformationListPages/Success.dart';
import 'package:mountain_trip_api/pages/ConfirmInformationListPages/widgets/Line.dart';

import '../../misc/colors.dart';

PageController pageController = PageController(initialPage: 0, keepPage: true);
void onButtonTape(int index) {
  pageController.animateToPage(index,
      duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
//  pageController.jumpToPage(index);
}

class ConFirmScreen extends StatefulWidget {
  const ConFirmScreen({Key? key}) : super(key: key);

  @override
  State<ConFirmScreen> createState() => _ConFirmScreenState();
}

class _ConFirmScreenState extends State<ConFirmScreen> {
  double _width1 = 0;
  double _width2 = 0;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> listPages = [
      ConfirmInformation(press: () {
        onButtonTape(1);
      }),
      Payement(
        press: () {
          onButtonTape(2);
        },
      ),
      Success(press: () {
        Navigator.pop(context);
      }),
    ];
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
              Icon(Icons.attach_money,
                  color:
                      (_currentIndex >= 1) ? AppColors.mainColor : Colors.grey),
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
                    width: _width2,
                    color: AppColors.mainColor,
                  )
                ],
              ),
              Icon(Icons.check_circle,
                  color:
                      (_currentIndex == 2) ? AppColors.mainColor : Colors.grey),
            ],
          ),
          const SizedBox(height: 40),
          Line(),
          const SizedBox(height: 40),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                  if (value == 0) {
                    _width1 = 0;
                    _width2 = 0;
                  } else if (value == 1) {
                    _width1 = 80;
                    _width2 = 0;
                  } else {
                    _width1 = 80;
                    _width2 = 80;
                  }
                });
              },
              itemCount: listPages.length,
              itemBuilder: (context, index) {
                return listPages[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
