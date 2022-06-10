import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mountain_trip_api/pages/tourGuide/widgets/Dateee.dart';
import 'package:mountain_trip_api/pages/tourGuide/widgets/ReciveCard.dart';
import 'package:mountain_trip_api/pages/tourGuide/widgets/SendCard.dart';

import '../../misc/colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white.withOpacity(0.3),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    InkWell(
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
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          'Stephen Cury',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.withOpacity(0.1),
                          ),
                          child: Text(
                            'Online',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/img/pngwing.com.png'),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          child: Container(
                            width: 11,
                            height: 11,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 92, 230, 97),
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.mainColor.withOpacity(0.3),
                        offset: Offset(-2, -2),
                        blurRadius: 100,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              SendCard(
                                title:
                                    'Hi guys my Name is Minh Hung \nI come from Viet Name',
                              ),
                              SendCard(
                                title: "oke luon",
                              ),
                              Dateee(title: "Yesterday"),
                              SendCard(
                                title:
                                    "Noi nghe ne lam nguoi thi Phai co gang hoc tap va tiem toi Nghe chua va Hieu chua",
                              ),
                              ReciveCard(title: "Nghe roi va hieu roi"),
                              Dateee(title: "To day"),
                              SendCard(
                                title:
                                    "Noi nghe ne lam nguoi thi Phai co gang hoc tap va tiem toi Nghe chua va Hieu chua",
                              ),
                              ReciveCard(
                                title:
                                    'Hi guys my Name is Minh Hung \nI come from Viet Name',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 4 * 3,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.mainColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.image,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                            4 *
                                            3 -
                                        80,
                                    child: TextFormField(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type of message",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.mic,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
