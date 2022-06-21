import 'package:flutter/material.dart';

import '../misc/colors.dart';
import 'ratingBar.dart';

class FavoritesLocation extends StatelessWidget {
  final String imagePath;
  final String name;
  final String location;
  final double rating;
  final Function() press;
  final bool checkMode;
  const FavoritesLocation({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.location,
    required this.rating,
    required this.press,
    required this.checkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 240,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (checkMode) ? Colors.white : Colors.grey,
            boxShadow: [
              BoxShadow(
                color:
                    (checkMode) ? Colors.black38.withOpacity(0.1) : Colors.grey,
                offset: Offset(-2, 2),
                blurRadius: 3,
              ),
              BoxShadow(
                color:
                    (checkMode) ? Colors.black38.withOpacity(0.1) : Colors.grey,
                offset: Offset(2, -2),
                blurRadius: 3,
              )
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 220 * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imagePath),
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
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.red.withOpacity(0.7),
                            size: 17,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(Icons.location_on_sharp,
                              color: AppColors.mainColor, size: 15),
                          const SizedBox(width: 4),
                          Text(
                            location,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Rating(
                        rating: rating,
                        icon: Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 13,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
