import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../misc/colors.dart';

class ResponSiveButton extends StatelessWidget {
  final String tittle;
  final Function() press;
  const ResponSiveButton({Key? key, required this.tittle, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        width: (tittle.isEmpty) ? 120 : 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: (tittle.isEmpty)
            ? Image(
                image: AssetImage('assets/img/button-one.png'),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tittle,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Image(
                    image: AssetImage('assets/img/button-one.png'),
                  )
                ],
              ),
      ),
    );
  }
}
