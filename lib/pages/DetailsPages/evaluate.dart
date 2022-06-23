import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mountain_trip_api/pages/DetailsPages/widgets/ButtonChoose.dart';
import 'package:mountain_trip_api/pages/DetailsPages/widgets/CharStar.dart';
import 'package:mountain_trip_api/pages/DetailsPages/widgets/Evaluation.dart';
import 'package:mountain_trip_api/pages/DetailsPages/widgets/PostComment.dart';

import '../../misc/colors.dart';

class Evaluate extends StatefulWidget {
  final bool checkMode;
  const Evaluate({Key? key, required this.checkMode}) : super(key: key);

  @override
  State<Evaluate> createState() => _EvaluateState();
}

class _EvaluateState extends State<Evaluate> {
  int indexClieck = 0;
  List<Map<String, dynamic>> _listButton = [
    {"title": "All", "index": 0, "check": true},
    {"title": "Positive", "index": 1, "check": false},
    {"title": "Negative", "index": 2, "check": false},
    {"title": "5 Star", "index": 3, "check": false},
    {"title": "4 Star", "index": 4, "check": false},
    {"title": "3 Star", "index": 5, "check": false},
    {"title": "2 Star", "index": 6, "check": false},
    {"title": "1 Star", "index": 7, "check": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (widget.checkMode) ? Colors.white : Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: (widget.checkMode) ? Colors.white : Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,
              color: (widget.checkMode) ? Colors.black : Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              child: PostComment(),
            ),
          );
        },
        child: SvgPicture.asset(
          'assets/icons/chat.svg',
          color: Colors.white,
          height: 20,
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
                          color:
                              (widget.checkMode) ? Colors.black : Colors.white,
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
                      CharStar(
                          star: 5,
                          all: 212,
                          eva: 126,
                          checkMode: widget.checkMode),
                      CharStar(
                          star: 4,
                          all: 212,
                          eva: 56,
                          checkMode: widget.checkMode),
                      CharStar(
                          star: 3,
                          all: 212,
                          eva: 12,
                          checkMode: widget.checkMode),
                      CharStar(
                          star: 2,
                          all: 212,
                          eva: 23,
                          checkMode: widget.checkMode),
                      CharStar(
                          star: 1,
                          all: 212,
                          eva: 212 - 56 - 126 - 23,
                          checkMode: widget.checkMode),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _listButton.map((e) {
                    return ButtonChoose(
                      tittle: e["title"],
                      press: () {
                        setState(() {
                          indexClieck = e["index"];
                        });
                      },
                      check: indexClieck == e["index"],
                    );
                  }).toList(),
                ),
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
