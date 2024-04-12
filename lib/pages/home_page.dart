import 'package:flutter/material.dart';
import 'package:task_api/const/const.dart';
import 'package:task_api/pages/login.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static String id = "homepage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
        title: Image(
          image: AssetImage('assets/images/img.png'),
          fit: BoxFit.cover,
          width: 30,
          height: 30,
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/img.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 16,
            ),
            Text(" This is your User Dashboard   ")
          ],
        ),
      ),
    );
  }
}
