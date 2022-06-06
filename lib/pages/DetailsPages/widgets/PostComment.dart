import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../misc/colors.dart';

class PostComment extends StatefulWidget {
  const PostComment({
    Key? key,
  }) : super(key: key);

  @override
  State<PostComment> createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment> {
  double slideValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [
        Text(
          double.parse((slideValue).toStringAsFixed(1)).toString(),
          style: TextStyle(
            color: AppColors.mainColor,
            fontSize: 80,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        RatingBar.builder(
          initialRating: slideValue,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 15,
          itemPadding: EdgeInsets.symmetric(horizontal: 2),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        Slider(
          value: slideValue,
          min: 0,
          max: 5,
          divisions: 95,
          activeColor: AppColors.mainColor,
          onChanged: (value) {
            setState(() {
              slideValue = value;
            });
          },
        ),
        Spacer(),
        Container(
          height: MediaQuery.of(context).size.height / 4.6,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.mainColor,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            maxLines: 8,
            decoration: InputDecoration(
              hintText: "Comment Here",
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.send,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ]),
    );
  }
}
