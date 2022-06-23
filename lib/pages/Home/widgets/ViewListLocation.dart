import 'package:flutter/material.dart';
import 'package:mountain_trip_api/data/fake_data.dart';
import 'package:mountain_trip_api/pages/DetailsPages/detailPages.dart';
import 'package:mountain_trip_api/pages/Home/widgets/LocationCard.dart';

class ViewListLocation extends StatelessWidget {
  final bool checkMode;
  const ViewListLocation({
    Key? key,
    required this.checkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: FakeData()
              .listCart
              .map(
                (e) => LocationCard(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(checkMode: checkMode),
                        ),
                      );
                    },
                    image: e["image"],
                    name: e["name"]),
              )
              .toList(),
        ),
      ),
    );
  }
}
