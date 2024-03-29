import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../misc/colors.dart';
import '../widgets/ratingBar.dart';

class FakeData {
  final List<String> HomeScreen = [
    'assets/img/welcome-one.png',
    'assets/img/welcome-two.png',
    'assets/img/welcome-three.png'
  ];
  final List<String> listImage = [
    'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/10_2020/khach-san-tren-vach-nui-da-Hotel_Country-Villa.jpg',
    'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/10_2020/The-Pingjiang-Homey-Wild-Luxury-Hotel.jpg',
    'https://vnn-imgs-a1.vgcloud.vn/znews-photo.zadn.vn/w1024/Uploaded/mdf_kxrxdf/2019_10_07/Wildflower_Hall.jpg',
    'https://dulichvietnam.com.vn/vnt_upload/news/10_2019/khach-san-tren-nui-2.jpg',
  ];

  // "assets/img/mountain.jpeg",
  // "assets/img/welcome-one.png",
  // "assets/img/welcome-three.png",
  // "assets/img/welcome-two.png",

  final List<Map<String, dynamic>> listEmployee = [];
  final List<Map<String, dynamic>> listCart = [
    {
      "id": 0,
      "image": "assets/img/mountain.jpeg",
      "name": "Everes",
      "Payement": "\$ 20.11",
      "type": 1,
      "person": 5,
      "date": "20-11-2002",
    },
    {
      "id": 1,
      "image": "assets/img/welcome-one.png",
      "name": "Nui Phu Sy",
      "Payement": "\$ 30.11",
      "type": 0,
      "person": 3,
      "date": "20-11-2002",
    },
    {
      "id": 2,
      "image": "assets/img/welcome-three.png",
      "name": "California",
      "Payement": "\$ 29.21",
      "type": 0,
      "person": 4,
      "date": "20-11-2002",
    },
    {
      "id": 3,
      "image": "assets/img/welcome-two.png",
      "name": "Linh ta linh tinh",
      "Payement": "\$ 10.23",
      "type": -1,
      "person": 2,
      "date": "20-11-2002",
    },
  ];

  final List<Map<String, dynamic>> listHotelCart = [
    {
      "id": 0,
      "image":
          'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/10_2020/khach-san-tren-vach-nui-da-Hotel_Country-Villa.jpg',
      "name": "Huong Binh Hotels",
      "Payement": "\$ 20.11",
      "type": 1,
      "person": 'Phong Doi',
      "date": "20-11-2002",
    },
    {
      "id": 1,
      "image":
          'https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/10_2020/The-Pingjiang-Homey-Wild-Luxury-Hotel.jpg',
      "name": "Tan Quoc Vuong Hotel",
      "Payement": "\$ 30.11",
      "type": 0,
      "person": 'Phong Don',
      "date": "20-11-2002",
    },
    {
      "id": 2,
      "image":
          'https://vnn-imgs-a1.vgcloud.vn/znews-photo.zadn.vn/w1024/Uploaded/mdf_kxrxdf/2019_10_07/Wildflower_Hall.jpg',
      "name": "5 Sao Hotel",
      "Payement": "\$ 29.21",
      "type": 0,
      "person": 'Phong Don',
      "date": "20-11-2002",
    },
    {
      "id": 3,
      "image":
          'https://dulichvietnam.com.vn/vnt_upload/news/10_2019/khach-san-tren-nui-2.jpg',
      "name": "Lalala Hotel",
      "Payement": "\$ 10.23",
      "type": -1,
      "person": 'Phong Doi',
      "date": "20-11-2002",
    },
  ];
  final List<Map<String, dynamic>> listButtonInProfile = [
    {
      'type': 0,
      'title': Text(
        'Tour Guide',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      'data': Text(
        '2011 Jobs in 2022',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      'color': AppColors.mainColor,
    },
    {},
    {
      'type': 1,
      'title': Text(
        'Following',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      'data': Text(
        '20k following',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      'color': Colors.white,
    },
    {
      'type': 2,
      'title': Text(
        'Evaluate',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      'data': Column(
        children: [
          Row(
            children: [
              Rating(
                rating: 4.5,
                icon: Icon(Icons.star, color: Colors.amber),
                itemCount: 5,
                itemSize: 14,
              ),
              Text(
                '(4,5)',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.star, color: AppColors.mainColor),
              const SizedBox(width: 5),
              Container(
                width: 100,
                child: Text(
                  '200k evalute',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ],
      ),
      'color': Colors.white,
    },
    {
      'type': 3,
      'title': Text(
        'Communications',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      'data': Column(
        children: [
          Row(
            children: [
              Icon(Icons.facebook, color: Colors.blue),
              const SizedBox(width: 5),
              Text(
                'Hung nguyen',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Row(
            children: [
              Icon(Icons.email, color: AppColors.mainColor),
              const SizedBox(width: 5),
              Container(
                width: 100,
                child: Text(
                  'hungnguyen.201102ak@gmail.com',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          Row(
            children: [
              Icon(Icons.phone, color: AppColors.mainColor),
              const SizedBox(width: 5),
              Text(
                '-084-935703991',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
      'color': Colors.white,
    },
    {
      'type': 4,
      'title': Text(
        'Top Comments',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      'data': Column(
        children: [
          Row(
            children: [
              Icon(Icons.person, color: AppColors.mainColor),
              const SizedBox(width: 5),
              Container(
                width: 120,
                child: Text(
                  'Hướng dẫn viên nhiệt tình ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.person, color: AppColors.mainColor, size: 16),
              const SizedBox(width: 5),
              Container(
                width: 120,
                child: Text(
                  'Vui tính',
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.person, color: AppColors.mainColor, size: 16),
              const SizedBox(width: 5),
              Container(
                width: 120,
                child: Text(
                  'Tuyệt vời ',
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'More',
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
      'color': Colors.white,
    },
    {
      'type': 5,
      'title': Text(
        'Chat with him/her',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      'data': Row(
        children: [
          Icon(Icons.chat, color: AppColors.mainColor),
          const SizedBox(width: 5),
          Text(
            'Let\'s Chat',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      'color': Colors.white,
    },
    {
      'type': 6,
      'title': Text(
        'Alll Posts',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      'data': Row(
        children: [
          Icon(Icons.image, color: AppColors.mainColor),
          const SizedBox(width: 5),
          Text(
            'See all Posts',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      'color': Colors.white,
    },
  ];

  final EasyColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.black26,
      AppColors.mainColor,
    ],
  );

  final MediumColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.black26, Colors.yellow],
  );
  final HardColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.black26,
      Colors.red,
    ],
  );

  final List<Map<String, dynamic>> listSport = [
    {
      "image1": "assets/img/kayaking.jpg",
      "image2": 'assets/img/kayaking.png',
      "color": AppColors.mainColor.withOpacity(0.8),
      "name": 'Kayaking',
    },
    {
      "image1": "assets/img/snorkling.jpg",
      "image2": 'assets/img/snorkling.png',
      "color": Color.fromARGB(255, 223, 161, 66),
      "name": 'Snorkling',
    },
    {
      "image1": "assets/img/baloning.jpg",
      "image2": 'assets/img/balloning.png',
      "color": Color.fromARGB(255, 103, 60, 111),
      "name": 'Balloning',
    },
    {
      "image1": "assets/img/hiking.jpg",
      "image2": 'assets/img/hiking.png',
      "color": Color.fromARGB(255, 70, 230, 166),
      "name": 'Hiking',
    },
  ];
}
