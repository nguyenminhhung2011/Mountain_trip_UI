import 'package:flutter/material.dart';
import 'package:mountain_trip_api/pages/Cart/widgets/CartHotelItem.dart';

import '../../../data/fake_data.dart';
import '../../../misc/colors.dart';
import 'CartTripItem.dart';

class CartHotels extends StatelessWidget {
  final bool checkMode;
  const CartHotels({Key? key, required this.checkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: FakeData().listHotelCart.length,
      itemBuilder: (contex, index) {
        return Dismissible(
          key: Key(
            FakeData().listHotelCart[index]["id"].toString(),
          ),
          background: Container(
              decoration: BoxDecoration(
                color: AppColors.mainColor.withOpacity(0.2),
              ),
              child: Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.delete, color: AppColors.mainColor),
                  )
                ],
              )),
          child: CartHotelItem(index: index, checkMode: checkMode),
        );
      },
    );
  }
}
