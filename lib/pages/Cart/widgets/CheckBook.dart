import 'package:flutter/material.dart';

class CheckBook extends StatelessWidget {
  final int type;
  const CheckBook({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: (type == 1)
            ? Colors.green.withOpacity(0.2)
            : (type == 0)
                ? Colors.yellow.withOpacity(0.2)
                : Colors.red.withOpacity(0.2),
      ),
      child: Text(
        (type == 1)
            ? 'Book'
            : (type == 0)
                ? 'Complete'
                : 'Cancelled',
        style: TextStyle(
          color: (type == 1)
              ? Colors.green
              : (type == 0)
                  ? Colors.yellow
                  : Colors.red,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
