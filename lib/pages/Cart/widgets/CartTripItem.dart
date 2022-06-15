import 'package:flutter/material.dart';
import 'package:mountain_trip_api/pages/Cart/widgets/CheckBook.dart';

import '../../../data/fake_data.dart';
import '../../../misc/colors.dart';
import '../BookInfor.dart';

class CartTripItem extends StatelessWidget {
  final int index;
  const CartTripItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookInfo(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Row(
          children: [
            Container(
              width: 65,
              height: 65,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: AppColors.mainColor),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      FakeData().listCart[index]["image"],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckBook(type: FakeData().listCart[index]["type"]),
                Text(
                  FakeData().listCart[index]["date"],
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      color: AppColors.mainColor,
                      size: 17,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      FakeData().listCart[index]["name"],
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: AppColors.mainColor,
                      size: 17,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      FakeData().listCart[index]["person"].toString() +
                          " person",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: AppColors.mainColor,
                      size: 17,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      FakeData().listCart[index]["Payement"],
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
