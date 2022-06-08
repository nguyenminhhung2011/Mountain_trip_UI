import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../misc/colors.dart';

class HotelCard extends StatelessWidget {
  final Function() press;
  const HotelCard({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      elevation: 4,
      child: InkWell(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.height / 6 - 40,
                height: MediaQuery.of(context).size.height / 6 - 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/10_2020/khach-san-tren-vach-nui-da-Hotel_Country-Villa.jpg'),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Huong Binh Hotel',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      // Spacer(),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.favorite_outline,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.6,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      'Day la 1 trong nhung khach san noi tieng nhat the gioi voiw kien truc vo cung doc dao va dawng cap toan bo ngoi nha duoc lam tuu go',
                      style: TextStyle(color: Colors.grey),
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        initialRating: 3.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 12,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 20,
                        width: 40,
                        padding: const EdgeInsets.all(2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: AppColors.mainColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '\$ 250',
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
