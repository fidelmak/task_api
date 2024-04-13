import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            child: Icon(
              Icons.person,
              color: primaryColor,
            ), // Replace Icons.person with your desired icon
            backgroundColor:
                backgroundColor, // Background color of the CircleAvatar
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Erwin Schrödinger",
                style: TextStyle(color: white, fontSize: 20),
              ),
              Text("level 2",
                  style: TextStyle(
                    color: Colors.amber,
                  )),
            ],
          ),
          Icon(
            Icons.settings,
            color: primaryColor,
          ),
          Icon(
            Icons.notification_add_rounded,
            color: primaryColor,
          ),
        ],
      ),
    );
  }
}
