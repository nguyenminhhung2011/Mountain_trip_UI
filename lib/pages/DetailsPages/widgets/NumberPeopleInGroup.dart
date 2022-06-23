import 'package:flutter/material.dart';

import '../../../misc/colors.dart';

class NumberPeopleInGroup extends StatelessWidget {
  final int no;
  final bool selected;
  final Function() press;
  final bool checkMode;
  const NumberPeopleInGroup({
    Key? key,
    required this.no,
    required this.press,
    required this.selected,
    required this.checkMode,
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
          color: (selected)
              ? (checkMode)
                  ? Colors.black
                  : Colors.white
              : (checkMode)
                  ? AppColors.mainColor.withOpacity(0.3)
                  : AppColors.mainColor,
        ),
        child: Text(
          no.toString(),
          style: TextStyle(
            color: (selected)
                ? (checkMode)
                    ? Colors.white
                    : Colors.black
                : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
