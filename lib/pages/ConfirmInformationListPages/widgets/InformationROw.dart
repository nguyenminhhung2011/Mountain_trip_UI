//Check personal information
import 'package:flutter/material.dart';

class InformationROw extends StatelessWidget {
  final String header;
  final String title;
  final Widget icon;
  const InformationROw({
    Key? key,
    required this.header,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 10),
        Text(
          header,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
