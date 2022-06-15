import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mountain_trip_api/pages/Search/widgets/SearchHotelsCard.dart';
import 'package:mountain_trip_api/pages/Search/widgets/SearchTripCard.dart';
import 'package:mountain_trip_api/widgets/TextFormFieldDesign.dart';

import '../../misc/colors.dart';

class SearchPages extends StatelessWidget {
  const SearchPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormFieldDesginWithIcon1(
              hintText: "Search",
              labelText: "",
              icon: Icon(
                Icons.search,
                color: AppColors.mainColor,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Result',
                  style: TextStyle(
                    color: Colors.black,
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
                    SearchTripCard(title: 'Dinh nui Everest', press: () {}),
                    SearchHotelsCard(title: 'Huong Binh Hotels', press: () {})
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
