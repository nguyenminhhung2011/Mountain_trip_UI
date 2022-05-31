import 'package:flutter/material.dart';

import '../../../misc/colors.dart';

class LocationCard extends StatelessWidget {
  final Function() press;
  const LocationCard({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        child: Stack(
          children: [
            Container(
              height: 270,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/mountain.jpeg'),
                ),
              ),
            ),
            Container(
              height: 270,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black26,
                    Colors.black26,
                    AppColors.mainColor,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 270,
                width: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cascade',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_sharp,
                            color: Colors.white, size: 15),
                        const SizedBox(width: 4),
                        Text('Canada, Banff',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
