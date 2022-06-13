import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../misc/colors.dart';

class Evaluation extends StatelessWidget {
  final String userName;
  final String tittle;
  final double star;
  const Evaluation({
    Key? key,
    required this.userName,
    required this.tittle,
    required this.star,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.mainColor, width: 2),
                ),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/img/pngwing.com.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                userName,
                style: TextStyle(
                  color: AppColors.textColor1,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Icon(Icons.more_vert,
                    size: 25, color: AppColors.textColor2),
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            RatingBar.builder(
              initialRating: star,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 13,
              itemPadding: EdgeInsets.symmetric(horizontal: 2),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            const SizedBox(width: 10),
            Text(
              '20/11/2002',
              style: TextStyle(
                color: AppColors.textColor2,
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        Text(
          tittle,
          style: TextStyle(
            color: AppColors.textColor2,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              'Was this review helpful?',
              style: TextStyle(color: AppColors.textColor2),
            ),
            Spacer(),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 50,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                    color: AppColors.mainColor,
                  ),
                ),
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 50,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                    color: AppColors.mainColor,
                  ),
                ),
                child: Text(
                  'No',
                  style: TextStyle(
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
