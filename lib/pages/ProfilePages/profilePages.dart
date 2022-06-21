import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../misc/colors.dart';

class ProfileScreen extends StatelessWidget {
  final bool checkMode;
  const ProfileScreen({Key? key, required this.checkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (checkMode) ? Colors.white : Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      //color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/img/mountain.jpeg"),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    bottom: -(MediaQuery.of(context).size.width * 0.3) / 1.5,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          //color: Colors.red,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30 + MediaQuery.of(context).size.width * 0.3 + 10,
                    bottom: -(MediaQuery.of(context).size.width * 0.3) / 1.5 +
                        (MediaQuery.of(context).size.width * 0.3) / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nguyen Minh Hung',
                          style: TextStyle(
                            color: (checkMode) ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'hungnguyen.201102ak@gmail.com',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.3,
            ),
            Button(
              icon: Icons.notifications,
              title: 'Notification',
              press: () {},
              checkMode: checkMode,
            ),
            const SizedBox(height: 10),
            Button(
              icon: Icons.message,
              title: 'Messenger',
              press: () {},
              checkMode: checkMode,
            ),
            const SizedBox(height: 10),
            Button(
              icon: Icons.support_agent,
              title: 'Support',
              press: () {},
              checkMode: checkMode,
            ),
            const SizedBox(height: 10),
            Button(
              icon: Icons.settings,
              title: 'Edit Personal Information',
              press: () {},
              checkMode: checkMode,
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red.withOpacity(0.7),
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
                  child: Row(
                    children: [
                      Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final Function() press;
  final IconData icon;
  final title;
  final bool checkMode;
  const Button({
    Key? key,
    required this.press,
    required this.icon,
    this.title,
    required this.checkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (checkMode) ? Colors.white : Colors.grey,
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
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.black87),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios,
                  color: (checkMode) ? Colors.grey : Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
