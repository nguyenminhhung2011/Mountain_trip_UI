import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../misc/colors.dart';

class ChooseTourGuideScreen extends StatelessWidget {
  const ChooseTourGuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [],
              )),
        ],
      ),
    );
  }
}
