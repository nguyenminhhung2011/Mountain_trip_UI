import 'package:flutter/material.dart';

import '../../../misc/colors.dart';

class SearchHotelsCard extends StatelessWidget {
  final String title;
  final Function() press;
  const SearchHotelsCard({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Icon(Icons.home_work_outlined, color: AppColors.mainColor),
            const SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            )
          ],
        ),
      ),
    );
  }
}
