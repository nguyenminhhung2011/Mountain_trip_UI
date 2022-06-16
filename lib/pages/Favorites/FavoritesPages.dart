import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mountain_trip_api/widgets/FavoritesLocation.dart';

import '../../data/fake_data.dart';
import '../../misc/colors.dart';

class FavoritesPages extends StatelessWidget {
  const FavoritesPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Favorites Location',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                Icon(Icons.favorite, color: AppColors.mainColor),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: MasonryGridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              itemCount: FakeData().listCart.length,
              itemBuilder: (context, index) => FavoritesLocation(
                imagePath: FakeData().listCart[index]["image"],
                name: FakeData().listCart[index]["name"],
                location: "Canada, Baff",
                rating: 4.3,
                press: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*
FavoritesLocation(
                        imagePath: e["image"],
                        name: e["name"],
                        location: "Canada, Baff",
                        rating: 4.3,
                        press: () {})
 */