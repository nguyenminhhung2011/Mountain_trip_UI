import 'package:flutter/material.dart';

import '../../../misc/colors.dart';

class PayementMethod extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function() press;
  final bool checkClick;
  const PayementMethod({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.press,
    required this.checkClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: press,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 2,
              color: (checkClick) ? AppColors.mainColor : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38.withOpacity(0.4),
                  offset: Offset(2, 3),
                  blurRadius: 3)
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 15,
                width: 15,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: (checkClick) ? AppColors.mainColor : Colors.grey,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: (checkClick) ? AppColors.mainColor : Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Image(
                height: 30,
                image: AssetImage(imagePath),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
