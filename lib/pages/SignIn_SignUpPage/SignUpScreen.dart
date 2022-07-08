import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mountain_trip_api/utils/utils.dart';

import '../../misc/colors.dart';
import '../../widgets/TextFormFieldDesign.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Uint8List? _image;
  @override
  void selectedImage() async {
    Uint8List file = await pickImage(ImageSource.camera);
    setState(() {
      _image = file;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/mountain.jpeg'),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black26,
                  AppColors.mainColor,
                ],
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Container(
                        height: 150,
                        child: Image(
                          image: AssetImage('assets/img/MountainLogo.png'),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.white),
                              ),
                              child: (_image == null)
                                  ? const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/img/mountain.jpeg'),
                                      radius: 45,
                                    )
                                  : CircleAvatar(
                                      radius: 45,
                                      backgroundImage: MemoryImage(_image!),
                                    ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pick Your Avatar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                InkWell(
                                  onTap: () {
                                    selectedImage();
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.textColor1,
                                    ),
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            TextFormFieldDesgin(
                              hintText: "Enter your Email",
                              labelText: "Email",
                            ),
                            const SizedBox(height: 20),
                            TextFormFieldPassword(
                              hintText: "Enter your Password",
                              labelText: "Password",
                            ),
                            const SizedBox(height: 20),
                            TextFormFieldPassword(
                              hintText: "Enter Re PassWord",
                              labelText: "Re_Password",
                            ),
                            const SizedBox(height: 7),
                            const SizedBox(height: 17),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.mainColor,
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/img/button-one.png'),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
