import 'package:flutter/material.dart';

import '../../../misc/colors.dart';

class NumberPeopleInGroup extends StatelessWidget {
  final int no;
  final bool selected;
  final Function() press;
  const NumberPeopleInGroup({
    Key? key,
    required this.no,
    required this.press,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:
              (selected) ? Colors.black : AppColors.mainColor.withOpacity(0.3),
        ),
        child: Text(
          no.toString(),
          style: TextStyle(
            color: (selected) ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
