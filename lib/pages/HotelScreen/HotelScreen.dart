import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mountain_trip_api/pages/DetailsPages/evaluate.dart';

import '../../data/fake_data.dart';
import '../../misc/colors.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({Key? key}) : super(key: key);

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(FakeData().listImage[selectedImage]),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black26,
                  AppColors.mainColor.withOpacity(0.5),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Icon(Icons.more_vert, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Brush Hotel',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '\$80',
                            style: TextStyle(
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            '/day',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.location_on_sharp,
                              color: AppColors.mainColor, size: 17),
                          const SizedBox(width: 4),
                          Text(
                            'Prague, Czech Republic',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 22),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.mainColor.withOpacity(0.2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Reviews',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColors.mainColor,
                                      size: 15,
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      '3.8',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      ' | 720 Reviews',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            // Stack(
                            //   children: [],
                            // )
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Evaluate(),
                                  ),
                                );
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: AppColors.mainColor,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38
                                                  .withOpacity(0.4),
                                              offset: Offset(2, 3),
                                              blurRadius: 3)
                                        ],
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/img/pngwing.com.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 30,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: AppColors.mainColor,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38
                                                  .withOpacity(0.4),
                                              offset: Offset(2, 3),
                                              blurRadius: 3)
                                        ],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/img/pngwing.com.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 60,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38
                                                  .withOpacity(0.4),
                                              offset: Offset(2, 3),
                                              blurRadius: 3)
                                        ],
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Icon(
                                        Icons.more_horiz,
                                        color: AppColors.mainColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 50),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Description',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Here hotel is  located in prague, and already got a recommendation from the czech repulic',
                        style: TextStyle(color: Colors.grey),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'List Picture',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    width:
                                        MediaQuery.of(context).size.width - 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: MasonryGridView.count(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4,
                                      itemCount: FakeData().listImage.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: (index % 2 == 0) ? 300 : 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  FakeData().listImage[index]),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 50,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: FakeData().listImage.length,
                            itemBuilder: ((context, index) {
                              return ImageCard(
                                press: () {
                                  setState(() {
                                    selectedImage = index;
                                  });
                                },
                                checkClick: selectedImage == index,
                                imagePath: FakeData().listImage[index],
                              );
                            })),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '\$ 1,422 ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              TextSpan(
                                text: '/day',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38.withOpacity(0.4),
                                offset: Offset(2, 3),
                                blurRadius: 3)
                          ],
                          color: AppColors.mainColor,
                        ),
                        child: Text(
                          'Book now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final Function() press;
  final String imagePath;
  final bool checkClick;
  const ImageCard({
    Key? key,
    required this.press,
    required this.imagePath,
    required this.checkClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 50,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color: (checkClick) ? Colors.blue : Colors.black,
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imagePath,
            ),
          ),
        ),
      ),
    );
  }
}
