//game with flutter
import 'package:flutter/material.dart';
import 'package:mountain_trip_api/pages/ConfirmInformationListPages/widgets/InformationROw.dart';
import 'package:mountain_trip_api/pages/ConfirmInformationListPages/widgets/Line.dart';
import 'package:mountain_trip_api/widgets/dateContainer.dart';

import '../../misc/colors.dart';

class ConfirmInformation extends StatelessWidget {
  final Function() press;
  const ConfirmInformation({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Checking Information',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          InformationROw(
              icon: Icon(Icons.tour, color: AppColors.mainColor),
              header: "Name of Mountain",
              title: "Everes Mountain"),
          const SizedBox(height: 10),
          InformationROw(
              icon: Icon(Icons.location_on, color: AppColors.mainColor),
              header: "Location of Mountain",
              title: "California,America"),
          const SizedBox(height: 10),
          InformationROw(
              icon: Icon(Icons.star, color: AppColors.mainColor),
              header: "Level",
              title: "Hard"),
          const SizedBox(height: 20),
          Line(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Check personal information',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          InformationROw(
              icon: Icon(Icons.person, color: AppColors.mainColor),
              header: "Name",
              title: "Nguyen Minh Hung"),
          const SizedBox(height: 10),
          InformationROw(
              icon: Icon(Icons.phone, color: AppColors.mainColor),
              header: "Phone Number",
              title: "0935703991"),
          const SizedBox(height: 10),
          InformationROw(
              icon: Icon(Icons.people, color: AppColors.mainColor),
              header: "No Person in Tour",
              title: "5"),
          const SizedBox(height: 20),
          DateCotainer(date: '20-11-200', checkMode: false),
          const SizedBox(height: 50),
          Row(
            children: [
              Container(
                height: 65,
                width: 65,
                //  padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: AppColors.mainColor),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.gps_fixed,
                  color: AppColors.mainColor,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: press,
                  child: Container(
                    alignment: Alignment.center,
                    height: 65,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38.withOpacity(0.4),
                            offset: Offset(2, 3),
                            blurRadius: 4)
                      ],
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
