import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/colors.dart';

class TimeDisplay extends StatefulWidget {
  final Widget field;
  const TimeDisplay({
    super.key,
    required this.field,
  });

  @override
  State<TimeDisplay> createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
        border: Border.all(
          color: backgroundColor, // Border color
          width: 2, // Border width
        ),
      ),
      child: Center(child: widget.field),
    );
  }
}
