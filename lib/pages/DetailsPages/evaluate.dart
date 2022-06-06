import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../misc/colors.dart';

class Evaluate extends StatelessWidget {
  const Evaluate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: AppColors.mainColor.withOpacity(0.7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(-1, -1),
              blurRadius: 150,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        '4.2',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      RatingBar.builder(
                        initialRating: 4.2,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: AppColors.mainColor,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '4.613.111',
                        style: TextStyle(
                          color: AppColors.textColor1,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      CharStar(star: 5, all: 212, eva: 126),
                      CharStar(star: 4, all: 212, eva: 56),
                      CharStar(star: 3, all: 212, eva: 12),
                      CharStar(star: 2, all: 212, eva: 23),
                      CharStar(star: 1, all: 212, eva: 212 - 56 - 126 - 23),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 0.5,
                  color: AppColors.mainColor),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    'assets/icons/chat.svg',
                    color: AppColors.mainColor,
                    height: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Comment of user',
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Evaluation(
                userName: 'Minh Hung',
                star: 4.2,
                tittle: 'Địa điểm này tuyệt vời lắm ạ ạ 10 điểm 10 điểm',
              ),
              Evaluation(
                userName: 'Đức Hoàng',
                star: 3.2,
                tittle: 'Địa Điểm tốt',
              ),
              Evaluation(
                userName: 'Trung Hiếu',
                star: 2.2,
                tittle: 'Trời quá lạnh không thể làm gì được',
              ),
              Evaluation(
                userName: 'Thiện Khải',
                star: 1.2,
                tittle: 'Không có gì để khen luôn á',
              ),
              Evaluation(
                userName: 'Quốc thắng',
                star: 5.0,
                tittle: 'Không còn mỹ từ nào để diễn tả về địa điểm này',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
                      image: NetworkImage(
                          'https://scontent.fsgn5-15.fna.fbcdn.net/v/t39.30808-1/283302695_586918832926290_7105784237859390906_n.jpg?stp=c62.0.160.160a_dst-jpg_p160x160&_nc_cat=111&ccb=1-7&_nc_sid=7206a8&_nc_ohc=eCaMGjmMvMwAX9ugid3&_nc_ht=scontent.fsgn5-15.fna&oh=00_AT-DUnBaYxTelXdsPaLrJl59joUVTKfSbNGsRCdMEYMmrg&oe=62A1A300'),
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

class CharStar extends StatelessWidget {
  final int star;
  final int all;
  final int eva;
  const CharStar({
    Key? key,
    required this.star,
    required this.all,
    required this.eva,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          star.toString(),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        const SizedBox(width: 5),
        Stack(
          children: [
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width / 1.8,
              decoration: BoxDecoration(
                color: AppColors.mainColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              height: 10,
              width: (eva / all) * MediaQuery.of(context).size.width / 1.8,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        )
      ],
    );
  }
}
