import 'package:flutter/material.dart';

class ActiveOrNot extends StatelessWidget {
  final bool checkActive;
  const ActiveOrNot({
    Key? key,
    required this.checkActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: (checkActive) ? Colors.green : Colors.red,
        ),
        color: (checkActive)
            ? Colors.green.withOpacity(0.05)
            : Colors.red.withOpacity(0.05),
      ),
      child: Text(
        (checkActive) ? 'Active' : 'Not Active',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: (checkActive) ? Colors.green : Colors.red,
          fontSize: 13,
        ),
      ),
    );
  }
}
