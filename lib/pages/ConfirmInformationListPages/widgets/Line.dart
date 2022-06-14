import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0.5,
      decoration: BoxDecoration(
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
              color: Colors.black38.withOpacity(0.4),
              offset: Offset(2, 3),
              blurRadius: 4)
        ],
      ),
    );
  }
}
