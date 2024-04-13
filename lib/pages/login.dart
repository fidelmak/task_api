import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:task_api/pages/home_page.dart';
import 'package:task_api/pages/welcome.dart';

import '../components/button.dart';
import '../components/text_field.dart';
import '../const/const.dart';
import 'sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static String id = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showSpinner = false;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Image.asset(
                          'assets/images/img.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Center(child: Text("input your username and password")),
                      SizedBox(
                        height: 25,
                      ),
                      MyTextField(
                        controller: usernameController,
                        hint: "Username",
                        obscure: false,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      MyTextField(
                        controller: passwordController,
                        hint: "Password",
                        obscure: true,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Button(
                          text: Text(
                            "LOGIN",
                            style: TextStyle(color: textColor),
                          ),
                          myFunc: () {
                            login();
                          }),
                    ]))),
        floatingActionButton: SizedBox(
          height: 30,
          width: 40,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.maybePop(context);
            },
            backgroundColor: Colors.grey[50],
            tooltip: 'Back to Welcome',
            child: const Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
          ),
        ));
  }

  Future<void> login() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    // validate
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter username and password.'),
      ));
      return;
    }

    setState(() {
      showSpinner = true;
    });

    try {
      var headers = {'Content-Type': 'application/json'};
      var data = json.encode({
        "username": username,
        "password": password,
      });
      var dio = Dio();
      var response = await dio.request(
        'https://fidelmak.pythonanywhere.com/login/',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      // check if success
      if (response.statusCode == 200) {
        print('Status code: ${response.statusCode}');
        print('Response data: ${json.encode(response.data)}');
        setState(() {
          showSpinner = false;
        });
        Navigator.pushNamed(context, HomePage.id);
      } else {
        // if not
        print('Status code: ${response.statusCode}');
        print('Response data: ${json.encode(response.data)}');
      }
    } catch (e) {
      print(e);
      setState(() {
        showSpinner = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Incorrect username or password.'),
      ));
    }
  }
}
