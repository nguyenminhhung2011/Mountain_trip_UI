import 'package:flutter/material.dart';

class Dateee extends StatelessWidget {
  final String title;
  const Dateee({
    Key? key,
    required this.title,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(3),
      alignment: Alignment.center,
      width: title.length.toDouble() * 10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black38.withOpacity(0.1),
            offset: Offset(-2, 2),
            blurRadius: 3,
          ),
          BoxShadow(
            color: Colors.black38.withOpacity(0.1),
            offset: Offset(2, -2),
            blurRadius: 3,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}
