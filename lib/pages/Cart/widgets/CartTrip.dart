import 'package:flutter/material.dart';

import '../../../data/fake_data.dart';
import '../../../misc/colors.dart';
import 'CartTripItem.dart';

class CartTrip extends StatelessWidget {
  const CartTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: FakeData().listCart.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(
            FakeData().listCart[index]["id"].toString(),
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
          child: CartTripItem(index: index),
        );
      },
    );
  }
}
