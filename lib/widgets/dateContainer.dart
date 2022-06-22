import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../misc/colors.dart';

class DateCotainer extends StatelessWidget {
  final bool checkMode;
  final String date;
  const DateCotainer({Key? key, required this.date, required this.checkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      //height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date of Trip',
                style: TextStyle(
                  color: checkMode ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "20-11-2002",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Spacer(),
          Icon(
            Icons.calendar_month,
            color: AppColors.mainColor,
          ),
        ],
      ),
    );
  }
}
