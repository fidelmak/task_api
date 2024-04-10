import 'package:flutter/material.dart';
import 'package:task_api/pages/home_page.dart';
import 'package:task_api/pages/welcome.dart';
import 'package:task_api/pages/login.dart';
import 'package:task_api/pages/sign_in.dart';

import 'pages/text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User',
      initialRoute: Welcome.id,
      routes: {
        Welcome.id: (context) => const Welcome(),
        Login.id: (context) => const Login(),
        SignUp.id: (context) => SignUp(),
        HomePage.id: (context) => HomePage()
      },
    );
  }
}
