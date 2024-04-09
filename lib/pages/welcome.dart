import 'package:flutter/material.dart';
import 'package:task_api/pages/login.dart';
import 'package:task_api/pages/sign_in.dart';

import '../components/button.dart';
import '../const/const.dart';

class Welcome extends StatelessWidget {
  static String id = "welcome";
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  text: Text(
                    "LOGIN",
                    style: TextStyle(color: textColor),
                  ),
                  myFunc: () {
                    Navigator.pushNamed(context, Login.id);
                  },
                ),
                SizedBox(
                  width: 16,
                ),
                Button(
                  text: Text(
                    "SIGNUP",
                    style: TextStyle(color: textColor),
                  ),
                  myFunc: () {
                    Navigator.pushNamed(context, SignUp.id);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
