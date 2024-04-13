import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MyIcons extends StatelessWidget {
  const MyIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NewIconRow(
            xicon: Icon(
              Icons.offline_bolt,
              color: primaryColor,
            ),
          ),
          NewIconRow(
              xicon: Icon(
            Icons.signal_wifi_0_bar_rounded,
            color: primaryColor,
          )),
          NewIconRow(xicon: Icon(Icons.whatshot_rounded, color: primaryColor)),
          NewIconRow(
              xicon: Icon(
            Icons.language_rounded,
            color: primaryColor,
          ))
        ],
      ),
    );
  }
}

class NewIconRow extends StatelessWidget {
  final Icon xicon;
  const NewIconRow({
    required this.xicon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black,
        border: Border.all(
          color: backgroundColor, // Border color
          width: 2, // Border width
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: CircleAvatar(
            child: xicon, // Replace Icons.person with your desired icon
            backgroundColor:
                backgroundColor, // Background color of the CircleAvatar
          ),
        ),
      ),
    );
  }
}
