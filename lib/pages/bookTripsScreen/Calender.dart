import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mountain_trip_api/pages/bookTripsScreen/googleMap.dart';
import 'package:mountain_trip_api/pages/bookTripsScreen/widgets/bills.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../misc/colors.dart';

class BookTrips extends StatefulWidget {
  const BookTrips({Key? key}) : super(key: key);

  @override
  State<BookTrips> createState() => _BookTripsState();
}

class _BookTripsState extends State<BookTrips> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDate = DateTime.now();
  DateTime focusDay = DateTime.now();
  String datetimePicker = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppColors.mainColor,
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => GoogleMaps(),
      //       ),
      //     );
      //   },
      //   child: Icon(Icons.send, color: Colors.white),
      // ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Choose Calender',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Spacer(),
                Icon(Icons.calendar_month, color: AppColors.mainColor),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoogleMaps(),
                      ),
                    );
                  },
                  child: Icon(Icons.send, color: AppColors.mainColor),
                )
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height / 2.3,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(width: 5, color: AppColors.mainColor)),
              child: TableCalendar(
                rowHeight: 45,
                focusedDay: focusDay,
                firstDay: DateTime(1990),
                lastDay: DateTime(2050),
                daysOfWeekVisible: true,
                sixWeekMonthsEnforced: true,
                shouldFillViewport: false,
                calendarFormat: format,
                headerStyle: HeaderStyle(
                  formatButtonTextStyle: TextStyle(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                  titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                    fontSize: 20,
                  ),
                  formatButtonDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: AppColors.mainColor,
                      )),
                ),
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },
                onDaySelected: (DateTime select, DateTime focus) {
                  setState(() {
                    selectedDate = select;
                    focusDay = focus;
                    datetimePicker = DateFormat('yyyy-MM-dd').format(focus);
                  });
                  // print(focusDay);
                  // print(selectedDate);
                },
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.starColor,
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                ),
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDate, date);
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.only(
                    //   topLeft: Radius.circular(20),
                    //   topRight: Radius.circular(20),
                    // ),
                    color: AppColors.mainColor.withOpacity(0.1),
                    border: Border(
                      bottom: BorderSide(width: 2, color: AppColors.mainColor),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: AppColors.mainColor,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        datetimePicker,
                        style: TextStyle(
                          color: AppColors.starColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.mainColor,
                      ),
                      child: Text(
                        'Select Datetime',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Bills()
          ],
        ),
      ),
    );
  }
}
