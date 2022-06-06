import 'package:flutter/material.dart';

import '../../../misc/colors.dart';

class CharStar extends StatelessWidget {
  final int star;
  final int all;
  final int eva;
  const CharStar({
    Key? key,
    required this.star,
    required this.all,
    required this.eva,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          star.toString(),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        const SizedBox(width: 5),
        Stack(
          children: [
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width / 1.8,
              decoration: BoxDecoration(
                color: AppColors.mainColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              height: 10,
              width: (eva / all) * MediaQuery.of(context).size.width / 1.8,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        )
      ],
    );
  }
}
