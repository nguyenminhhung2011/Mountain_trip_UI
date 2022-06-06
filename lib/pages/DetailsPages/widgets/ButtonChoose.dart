import 'package:flutter/material.dart';

import '../../../misc/colors.dart';

class ButtonChoose extends StatelessWidget {
  final String tittle;
  final Function() press;
  final bool check;
  const ButtonChoose(
      {Key? key,
      required this.tittle,
      required this.press,
      required this.check})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: press,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 35,
          decoration: BoxDecoration(
            color: check ? AppColors.mainColor : Colors.white,
            border: Border.all(
              width: 1,
              color: AppColors.mainColor,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            tittle,
            style: TextStyle(color: check ? Colors.white : AppColors.mainColor),
          ),
        ),
      ),
    );
  }
}
