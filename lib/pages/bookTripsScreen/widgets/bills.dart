import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../misc/colors.dart';

class Bills extends StatelessWidget {
  const Bills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: MediaQuery.of(context).size.height / 2.8,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color: AppColors.starColor,
            ),
            color: AppColors.starColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img/mountain.jpeg'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Mountain Trip',
                    style: TextStyle(
                      color: AppColors.textColor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    'assets/icons/tag.svg',
                    height: 20,
                    color: AppColors.starColor,
                  )
                ],
              ),
              Text(
                'Yosemite',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.location_on_sharp,
                      color: AppColors.mainColor, size: 15),
                  const SizedBox(width: 4),
                  Text(
                    'Usa, California',
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.people, color: AppColors.mainColor, size: 15),
                  const SizedBox(width: 4),
                  Text(
                    '5 persons in trip',
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.calendar_month,
                      color: AppColors.mainColor, size: 15),
                  const SizedBox(width: 4),
                  Text(
                    '2022-06-30',
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.home, color: AppColors.mainColor, size: 15),
                  const SizedBox(width: 4),
                  Text(
                    'Vincom Plaza',
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.person, color: AppColors.mainColor, size: 15),
                  const SizedBox(width: 4),
                  Text(
                    'Nguyen Minh Hung',
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.mainColor,
                      ),
                      child: Text(
                        '\$ 250',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          left: -25,
          top: -25,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                width: 4,
                color: AppColors.starColor,
              ),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          right: -25,
          top: -25,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                width: 4,
                color: AppColors.starColor,
              ),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          right: -25,
          bottom: -25,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                width: 4,
                color: AppColors.starColor,
              ),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          left: -25,
          bottom: -25,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                width: 4,
                color: AppColors.starColor,
              ),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    );
  }
}
