import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mountain_trip_api/pages/Cart/BookInfor.dart';
import 'package:mountain_trip_api/pages/Cart/vourcherMain.dart';
import 'package:mountain_trip_api/pages/Cart/widgets/CartHotels.dart';
import 'package:mountain_trip_api/pages/Cart/widgets/CartTrip.dart';

import '../../data/fake_data.dart';
import '../../misc/colors.dart';

class CartMain extends StatefulWidget {
  const CartMain({Key? key}) : super(key: key);

  @override
  State<CartMain> createState() => _CartMainState();
}

class _CartMainState extends State<CartMain> {
  List<Widget> listPages = [CartMain(), Container()];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Row(
            children: [
              Text(
                'Your Trip:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' 4 Items',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          bottom: TabBar(
            indicatorColor: AppColors.mainColor,
            tabs: [
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.tour, color: AppColors.mainColor),
                    const SizedBox(width: 5),
                    Text(
                      'Trip',
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.hotel, color: AppColors.mainColor),
                    const SizedBox(width: 5),
                    Text(
                      'Hotels',
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Expanded(child: CartTrip()),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                Expanded(child: CartHotels()),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -15),
                color: Colors.black.withOpacity(0.09),
                blurRadius: 20,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/receipt.svg",
                      color: AppColors.mainColor,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text('Add Voucher code'),
                        const SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 13,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      text: 'Total\n',
                      children: [
                        TextSpan(
                          text: '\$337.19',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 190,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VoucherMain(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38.withOpacity(0.4),
                                offset: Offset(2, 3),
                                blurRadius: 3)
                          ],
                        ),
                        child: Text(
                          'All Voucher',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
