import 'package:flutter/material.dart';

import '../../../misc/colors.dart';
import '../../../widgets/ratingBar.dart';
import '../../DetailsPages/detailPages.dart';

class PlacesWithLevel extends StatelessWidget {
  final String imagePath;
  final String name;
  final String location;
  final double height;
  final bool checkMode;
  const PlacesWithLevel({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.location,
    required this.height,
    required this.checkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(checkMode: checkMode),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(-2, 3),
                      blurRadius: 3,
                    ),
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(2, -3),
                      blurRadius: 3,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: (checkMode) ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                            size: 17,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            'Thi Xa An Khe, VietName',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.height,
                            color: AppColors.mainColor,
                            size: 17,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '2100 m',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Rating(
                            rating: 4.5,
                            icon: Icon(Icons.star, color: Colors.amber),
                            itemCount: 5,
                            itemSize: 12,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
