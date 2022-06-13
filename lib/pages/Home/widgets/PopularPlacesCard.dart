import 'package:flutter/material.dart';

import '../../../misc/colors.dart';
import '../../../widgets/ratingBar.dart';

class PopularPlacesCard extends StatelessWidget {
  const PopularPlacesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 220,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
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
              )
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 220 * 0.7,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/mountain.jpeg'),
                  ),
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
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cascade',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_sharp,
                                color: AppColors.mainColor, size: 15),
                            const SizedBox(width: 4),
                            Text(
                              'Canada, Banff',
                              style: TextStyle(color: Colors.black),
                            ),
                            Spacer(),
                            Rating(
                              rating: 3.5,
                              icon: Icon(Icons.star, color: Colors.amber),
                              itemCount: 5,
                              itemSize: 13,
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
