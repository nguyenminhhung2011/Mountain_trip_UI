import 'package:flutter/material.dart';
import 'package:mountain_trip_api/pages/Cart/widgets/CheckBook.dart';

import '../../../data/fake_data.dart';
import '../../../misc/colors.dart';

class CartHotelItem extends StatelessWidget {
  final int index;
  const CartHotelItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: AppColors.mainColor),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      FakeData().listHotelCart[index]["image"],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckBook(type: FakeData().listHotelCart[index]["type"]),
                Text(
                  FakeData().listHotelCart[index]["date"],
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
                      Icons.home_work_outlined,
                      color: AppColors.mainColor,
                      size: 17,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      FakeData().listHotelCart[index]["name"],
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
                      Icons.bed,
                      color: AppColors.mainColor,
                      size: 17,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      FakeData().listHotelCart[index]["person"].toString(),
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
                      FakeData().listHotelCart[index]["Payement"],
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
