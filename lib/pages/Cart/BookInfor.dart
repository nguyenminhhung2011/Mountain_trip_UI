import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mountain_trip_api/widgets/dateContainer.dart';

import '../../misc/colors.dart';
import '../ConfirmInformationListPages/widgets/InformationROw.dart';
import '../ConfirmInformationListPages/widgets/Line.dart';

class BookInfo extends StatelessWidget {
  final bool checkMode;
  const BookInfo({Key? key, required this.checkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: checkMode ? Colors.white : Colors.black,
      appBar: AppBar(
        backgroundColor: checkMode ? Colors.white : Colors.black,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: (checkMode) ? Colors.black : Colors.white,
          ),
        ),
        title: Text(
          'Book Information',
          style: TextStyle(
            color: (checkMode) ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.tour,
                  color: AppColors.mainColor,
                ),
                const SizedBox(width: 5),
                Text(
                  'Nui Phu Sy',
                  style: TextStyle(
                    color: (checkMode) ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: "Sen",
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.mainColor,
                  size: 17,
                ),
                const SizedBox(width: 5),
                Text(
                  'Thi Xa An Khe, Tinh Gia Lai',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Sen",
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: AppColors.mainColor,
                  size: 17,
                ),
                const SizedBox(width: 5),
                Text(
                  '5 Person',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    fontFamily: "Sen",
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Line(),
            const SizedBox(height: 20),
            DateCotainer(date: '20-11-2002', checkMode: checkMode),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.access_time_filled_sharp,
                  color: AppColors.mainColor,
                  size: 17,
                ),
                const SizedBox(width: 5),
                Text(
                  'Time Book',
                  style: TextStyle(
                    color: (checkMode) ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Sen",
                  ),
                ),
                Spacer(),
                Text(
                  '20-10-2002: 14:30',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Sen",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Line(),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.assignment_turned_in_sharp,
                  color: AppColors.mainColor,
                ),
                const SizedBox(width: 5),
                Text(
                  'Payement',
                  style: TextStyle(
                    color: (checkMode) ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
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
                    color: (checkMode) ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Text(
                  "\$ 19.00",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Line(),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Payment Status',
                  style: TextStyle(
                    color: (checkMode) ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Sen",
                  ),
                ),
                Spacer(),
                Text(
                  'Upaid',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Sen",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Payment methods',
                  style: TextStyle(
                    color: (checkMode) ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Sen",
                  ),
                ),
                Spacer(),
                Text(
                  'Pay with Momo',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: "Sen",
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.red),
                    ),
                    child: Text(
                      'Cancelled',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: AppColors.mainColor),
                    ),
                    child: Text(
                      'QR Code',
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
//Payment Status