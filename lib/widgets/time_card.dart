import 'package:flutter/material.dart';

import '../const/const.dart';
import '../utils/colors.dart';
import 'dateFormat.dart';
import 'time_display.dart';

DateFormats show = DateFormats();

class TimeCard extends StatefulWidget {
  const TimeCard({super.key});

  @override
  State<TimeCard> createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
        border: Border.all(
          color: backgroundColor, // Border color
          width: 2, // Border width
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "The Launch Date is Near ",
              style: TextStyle(color: white),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    TimeDisplay(
                      field: Text(
                        show.getCurrentDay(),
                        style: TextStyle(color: white),
                      ),
                    ),
                  ],
                ),
                TimeDisplay(
                  field: Text(
                    show.getCurrenHour(),
                    style: TextStyle(color: white),
                  ),
                ),
                TimeDisplay(
                  field: Text(
                    show.getCurrentMinute(),
                    style: TextStyle(color: white),
                  ),
                ),
                TimeDisplay(
                  field: Text(
                    show.getCurrentSec(),
                    style: TextStyle(color: white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
