import 'package:flutter/material.dart';

class SearchTripCard extends StatelessWidget {
  final String title;
  final Function() press;
  const SearchTripCard({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Image(
              image: AssetImage('assets/img/mountain.png'),
              height: 30,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            )
          ],
        ),
      ),
    );
  }
}
