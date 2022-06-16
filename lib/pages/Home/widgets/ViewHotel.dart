import 'package:flutter/material.dart';
import 'package:mountain_trip_api/pages/Home/widgets/HotelsCard.dart';

import '../../../data/fake_data.dart';
import '../../../misc/colors.dart';
import '../../HotelScreen/allHotels.dart';

class ViewHotel extends StatelessWidget {
  const ViewHotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllHotels(),
                ),
              );
            },
            child: Text(
              'See All Hotel',
              style: TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: FakeData()
                    .listHotelCart
                    .map((e) => HotelsCard(image: e["image"], name: e["name"]))
                    .toList()),
          ),
        ],
      ),
    );
  }
}
