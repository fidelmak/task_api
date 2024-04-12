import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:task_api/pages/login.dart';
import 'package:task_api/pages/welcome.dart';

import '../components/button.dart';
import '../components/text_field.dart';
import '../const/const.dart';
import 'home_page.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});
  static String id = "signUp";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showSpinner = false; // Moved here

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
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
              SizedBox(height: 10),
              Center(child: Text("Register as a user")),
              SizedBox(height: 5),
              Expanded(
                child: ListView(
                  children: [
                    MyTextField(
                      hint: "Username",
                      obscure: false,
                      controller: usernameController,
                    ),
                    SizedBox(height: 10),
                    MyTextField(
                      controller: passwordController,
                      hint: "Password",
                      obscure: true,
                    ),
                    SizedBox(height: 10),
                    MyTextField(
                      controller: emailController,
                      hint: "email",
                      obscure: false,
                    ),
                    SizedBox(height: 10),
                    MyTextField(
                      controller: phoneController,
                      hint: "phone number",
                      obscure: false,
                    ),
                    SizedBox(height: 10),
                    MyTextField(
                      controller: addressController,
                      hint: "address",
                      obscure: false,
                    ),
                    SizedBox(height: 10),
                    MyTextField(
                      controller: imageController,
                      hint: "address",
                      obscure: false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Button(
                text: Text(
                  "SIGNUP",
                  style: TextStyle(color: textColor),
                ),
                myFunc: () {
                  signIn();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 30,
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
      ),
    );
  }

  Future<void> signIn() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    // Validate other fields
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String address = addressController.text.trim();
    String image = imageController.text.trim();

    // Validate username and password
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter username and password.'),
      ));
      return;
    }

    // You can add further validation for email, phone, address, etc. here

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
        'https://fidelmak.pythonanywhere.com/signup/',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print('Status code: ${response.statusCode}');
        print('Response data: ${json.encode(response.data)}');
        setState(() {
          showSpinner = false;
        });
        Navigator.pushNamed(context, Login.id);
      } else {
        // if not
        print('Status code: ${response.statusCode}');
        print('Response data: ${json.encode(response.data)}');
        setState(() {
          showSpinner = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(' username exist '),
        ));
      }
    } catch (e) {
      setState(() {
        showSpinner = false;
      });
      // shows snackbar
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('try again.'),
      ));
    }
  }
}
