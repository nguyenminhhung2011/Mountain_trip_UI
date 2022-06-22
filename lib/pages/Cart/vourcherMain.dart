import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../misc/colors.dart';

class VoucherMain extends StatelessWidget {
  final bool checkMode;
  const VoucherMain({Key? key, required this.checkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (checkMode) ? Colors.white : Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: (checkMode) ? Colors.white : Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: (checkMode) ? Colors.black : Colors.white,
          ),
        ),
        title: Row(
          children: [
            Text(
              'All Voucher:',
              style: TextStyle(
                color: (checkMode) ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' 4 Items',
              style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Voucher(checkMode: checkMode),
            Voucher(checkMode: checkMode),
          ],
        ),
      ),
    );
  }
}

class Voucher extends StatefulWidget {
  final bool checkMode;
  const Voucher({
    Key? key,
    required this.checkMode,
  }) : super(key: key);

  @override
  State<Voucher> createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  final List<int> l = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      for (int i = 0; i < 19; i++) {
        l.add(i);
      }
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        //  clipBehavior: Clip.none,
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
              color: AppColors.mainColor.withOpacity(0.1),
              border: Border.all(
                width: 2,
                color: AppColors.mainColor,
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: l
                    .map(
                      (e) => Container(
                        width: MediaQuery.of(context).size.width / 25,
                        height: 0.5,
                        color: (e % 2 == 0)
                            ? Colors.grey
                            : AppColors.mainColor.withOpacity(0.1),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Container(
            height: 150,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.discount,
                      color: AppColors.mainColor,
                      size: 18,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      'Discount: 15',
                      style: TextStyle(
                        color: (widget.checkMode) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  'Happy BirthDay',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Expired Date:",
                      style: TextStyle(
                        color: (widget.checkMode) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "20-11-2002",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Code:",
                      style: TextStyle(
                        color: (widget.checkMode) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "happyhappy",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            top: -15,
            left: -15,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.checkMode ? Colors.white : Colors.black,
                border: Border.all(
                  width: 2,
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ),
          Positioned(
            top: -15,
            right: -15,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.checkMode ? Colors.white : Colors.black,
                border: Border.all(
                  width: 2,
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -15,
            right: -15,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.checkMode ? Colors.white : Colors.black,
                border: Border.all(
                  width: 2,
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -15,
            left: -15,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.checkMode ? Colors.white : Colors.black,
                border: Border.all(
                  width: 2,
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: -15,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.checkMode ? Colors.white : Colors.black,
                border: Border.all(
                  width: 2,
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            right: -15,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.checkMode ? Colors.white : Colors.black,
                border: Border.all(
                  width: 2,
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
