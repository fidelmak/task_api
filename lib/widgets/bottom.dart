import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../const/const.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final iconList = [Icons.home, Icons.search, Icons.notifications];
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
              border: Border.all(
                color: backgroundColor, // Border color
                width: 2, // Border width
              ),
            ),
            height: 60,
            // Background color of the footer
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.home,
                  color: primaryColor, // White color
                  // Add other properties as needed, e.g., size
                ),
                Icon(
                  Icons.explore,
                  color: Colors.grey, // White color
                  // Add other properties as needed, e.g., size
                ),
                Icon(
                  Icons.message_outlined,
                  color: Colors.grey, // White color
                  // Add other properties as needed, e.g., size
                ),
                Icon(
                  Icons.verified_user_outlined,
                  color: Colors.grey, // White color
                  // Add other properties as needed, e.g., size
                ),
              ],
            )));
  }
}
