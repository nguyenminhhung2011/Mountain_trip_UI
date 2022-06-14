import 'package:flutter/material.dart';
import 'package:mountain_trip_api/pages/ConfirmInformationListPages/widgets/InformationROw.dart';
import 'package:mountain_trip_api/pages/ConfirmInformationListPages/widgets/Line.dart';
import 'package:mountain_trip_api/pages/ConfirmInformationListPages/widgets/PayementMethod.dart';

import '../../misc/colors.dart';

class Payement extends StatefulWidget {
  final Function() press;
  const Payement({Key? key, required this.press}) : super(key: key);

  @override
  State<Payement> createState() => _PayementState();
}

class _PayementState extends State<Payement> {
  List<Map<String, dynamic>> listPayementButton = [
    {
      "image": "assets/img/mountain.png",
      "title": "Pay at the location",
      "check": false,
    },
    {
      "image": "assets/img/Zalopay.png",
      "title": "Pay with Zalo pay",
      "check": false,
    },
    {
      "image": "assets/img/Momo.png",
      "title": "Pay with Momo",
      "check": false,
    },
    {
      "image": "assets/img/Visa.png",
      "title": "Pay with Visa",
      "check": false,
    },
  ];

  @override
  void onClick(String title) {
    setState(() {
      for (var item in listPayementButton) {
        if (item["title"] == title) {
          item["check"] = true;
        } else {
          item["check"] = false;
        }
      }
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Please select a payment method',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: listPayementButton
                .map(
                  (e) => PayementMethod(
                    imagePath: e["image"],
                    title: e["title"],
                    press: () {
                      onClick(e["title"]);
                    },
                    checkClick: e["check"],
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          Line(),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.65,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.mainColor.withOpacity(0.2),
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Voucher ID",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.22,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Confim',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Line(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Payement',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          InformationROw(
            header: "Payement",
            title: "\$ 20.22",
            icon: Icon(
              Icons.attach_money,
              color: AppColors.mainColor,
              size: 20,
            ),
          ),
          const SizedBox(height: 10),
          InformationROw(
            header: "Discount",
            title: "\$ 1.22",
            icon: Icon(
              Icons.discount,
              color: AppColors.mainColor,
              size: 20,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.payments, color: AppColors.mainColor),
              const SizedBox(width: 10),
              Text(
                "Total Payement",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Text(
                "\$ 19.00",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Line(),
          const SizedBox(height: 20),
          InkWell(
            onTap: widget.press,
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
        ],
      ),
    );
  }
}
