import 'package:flutter/material.dart';

import '../../misc/colors.dart';

class Success extends StatelessWidget {
  final Function() press;
  final bool checkMode;
  const Success({
    Key? key,
    required this.press,
    required this.checkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Stack(
              children: [
                Image(
                  image: AssetImage('assets/img/Pattern Success.png'),
                  color: AppColors.mainColor,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: AppColors.mainColor,
                          size: 100,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          //const SizedBox(height: 30),
          Text(
            'Hey Minh Hung',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'Thank you for booking the trip',
            style: TextStyle(
              color: (checkMode) ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'Have a nice day',
            style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 50),
          InkWell(
            onTap: press,
            child: Container(
              alignment: Alignment.center,
              height: 65,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(10),
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
        ],
      ),
    );
  }
}
