import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mountain_trip_api/pages/Search/widgets/SearchHotelsCard.dart';
import 'package:mountain_trip_api/pages/Search/widgets/SearchTripCard.dart';
import 'package:mountain_trip_api/pages/bookTripsScreen/googleMap.dart';
import 'package:mountain_trip_api/widgets/TextFormFieldDesign.dart';

import '../../misc/colors.dart';

class SearchPages extends StatelessWidget {
  final bool checkMode;
  const SearchPages({Key? key, required this.checkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: (checkMode) ? Colors.white : Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormFieldDesginWithIcon1(
              checkMode: checkMode,
              hintText: "Search",
              labelText: "",
              icon: Icon(
                Icons.search,
                color: AppColors.mainColor,
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GoogleMaps(checkMode: checkMode),
                  ),
                );
              },
              child: Row(
                children: [
                  Text(
                    'Find in Google Map',
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.find_in_page, color: AppColors.mainColor),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Result',
                  style: TextStyle(
                    color: (checkMode) ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SearchTripCard(
                        title: 'Dinh nui Everest',
                        press: () {},
                        checkMode: checkMode),
                    SearchHotelsCard(
                        title: 'Huong Binh Hotels',
                        press: () {},
                        checkMode: checkMode)
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
