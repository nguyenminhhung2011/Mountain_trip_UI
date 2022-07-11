import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mountain_trip_api/controls/profileControl.dart';
import 'package:mountain_trip_api/controls/userController.dart';

import '../../misc/colors.dart';
import '../../utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  final bool checkMode;

  ProfileScreen({Key? key, required this.checkMode}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userC = Get.find<UserController>();
  final proC = Get.find<ProFileC>();

  void initState() {
    super.initState();
    proC.nameC.text = userC.user.name;
    proC.emailC.text = userC.user.email;
    proC.phoneC.text = userC.user.phoneNumber;
  }

  void changePass() async {
    String change = await userC.changePass(
      userC.user.id,
      proC.passC.text,
      proC.newPassC.text,
      proC.rePsasC.text,
    );
    // SnackBarNoti("Change Password", "Change Password is success");
    //
    print(change);
    if (change == "yes") {
      // Get.back();
      setState(() {
        proC.passC.clear();
        proC.newPassC.clear();
        proC.rePsasC.clear();
      });
    }
  }

  void UpdateProfiile() async {
    String change = await userC.EditProfile(
      userC.user.id,
      proC.nameC.text,
      proC.emailC.text,
      "7777777777",
      proC.phoneC.text,
    );

    print(change);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: (widget.checkMode) ? Colors.white : Colors.black,
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
                        bottom:
                            -(MediaQuery.of(context).size.width * 0.3) / 1.5,
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
                                image: (userC.user.avatar == "null")
                                    ? NetworkImage(
                                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
                                      )
                                    : NetworkImage(userC.user.avatar),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30 + MediaQuery.of(context).size.width * 0.3 + 10,
                        bottom:
                            -(MediaQuery.of(context).size.width * 0.3) / 1.5 +
                                (MediaQuery.of(context).size.width * 0.3) / 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userC.user.name,
                              style: TextStyle(
                                color: (widget.checkMode)
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              userC.user.email,
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
                (proC.checkPages == 0)
                    ? Column(
                        children: [
                          Button(
                            icon: Icons.notifications,
                            title: 'Notification',
                            press: () {
                              print(userC.user.avatar);
                            },
                            checkMode: widget.checkMode,
                          ),
                          const SizedBox(height: 10),
                          Button(
                            icon: Icons.message,
                            title: 'Messenger',
                            press: () {
                              print(userC.user.name);
                              Get.reload();
                            },
                            checkMode: widget.checkMode,
                          ),
                          const SizedBox(height: 10),
                          Button(
                            icon: Icons.support_agent,
                            title: 'Support',
                            press: () {},
                            checkMode: widget.checkMode,
                          ),
                          const SizedBox(height: 10),
                          Button(
                            icon: Icons.settings,
                            title: 'Edit Personal Information',
                            press: () {
                              setState(() {
                                proC.checkPages = 4;
                              });
                            },
                            checkMode: widget.checkMode,
                          ),
                          const SizedBox(height: 50),
                          InkWell(
                            onTap: () {
                              userC.SignOut();
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
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
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 20),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    proC.checkPages = 0;
                                  });
                                },
                                child: Icon(Icons.arrow_back_ios),
                              ),
                              Text(
                                'Edit Your Profile',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Tex_Icon(icon: Icons.person, control: proC.nameC),
                          const SizedBox(height: 10),
                          Tex_Icon(icon: Icons.email, control: proC.emailC),
                          const SizedBox(height: 10),
                          Tex_Icon(icon: Icons.phone, control: proC.phoneC),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(children: [
                                        Row(
                                          children: [
                                            const SizedBox(width: 10),
                                            Icon(Icons.lock,
                                                color: AppColors.mainColor),
                                            const SizedBox(width: 5),
                                            Text(
                                              'Change Your Password',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 40),
                                        Pass_Icon(
                                            control: proC.passC,
                                            hintText: "Your Password"),
                                        const SizedBox(height: 10),
                                        Pass_Icon(
                                            control: proC.newPassC,
                                            hintText: "New Password"),
                                        const SizedBox(height: 10),
                                        Pass_Icon(
                                            control: proC.rePsasC,
                                            hintText: "Re Password"),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: InkWell(
                                            onTap: () {
                                              changePass();
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15),
                                              decoration: BoxDecoration(
                                                color: AppColors.mainColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black38
                                                        .withOpacity(0.1),
                                                    offset: Offset(-2, 2),
                                                    blurRadius: 3,
                                                  ),
                                                  BoxShadow(
                                                    color: Colors.black38
                                                        .withOpacity(0.1),
                                                    offset: Offset(2, -2),
                                                    blurRadius: 3,
                                                  )
                                                ],
                                              ),
                                              child: Text(
                                                'Update Your Password',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
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
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.key,
                                        color: AppColors.mainColor,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Change Your password',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              setState(() {
                                UpdateProfiile();
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.mainColor,
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
                              child: Text(
                                'Update',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ));
  }
}

class Tex_Icon extends StatelessWidget {
  final IconData icon;
  final TextEditingController control;
  const Tex_Icon({
    Key? key,
    required this.icon,
    required this.control,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
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
          Icon(icon, color: AppColors.mainColor),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: control,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Pass_Icon extends StatefulWidget {
  final TextEditingController control;
  final String hintText;
  const Pass_Icon({
    Key? key,
    required this.control,
    required this.hintText,
  }) : super(key: key);

  @override
  State<Pass_Icon> createState() => _Pass_IconState();
}

class _Pass_IconState extends State<Pass_Icon> {
  bool check_show = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
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
          InkWell(
            onTap: () {
              setState(() {
                check_show = !check_show;
              });
            },
            child: Icon(
              (check_show) ? Icons.visibility : Icons.visibility_off,
              color: AppColors.mainColor,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              obscureText: check_show,
              controller: widget.control,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
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
