import 'package:flutter/material.dart';

import '../../../misc/colors.dart';

class DiffCard extends StatelessWidget {
  final String icon;
  final String tittle;
  final Function() press;
  const DiffCard({
    Key? key,
    required this.icon,
    required this.tittle,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: press,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(icon),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            tittle,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
