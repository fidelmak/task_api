import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:task_api/pages/login.dart';

import '../api/data.dart';
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
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String address = addressController.text.trim();
    String image = imageController.text.trim();

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
      print("sending");
      // Make POST request to sign-up endpoint
      http.Response response = await http.post(
        Uri.parse('https://stacked.com.ng/api/register'), // Change to HTTPS
        body: {
          'username': username,
          'password': password,
          'email': email,
          'phone': phone,
          'address': address,
          'image': image,
        },
      );

      // If sign-up is successful, handle the response
      if (response.statusCode == 200) {
        // Handle successful sign-up
        print('Sign-up successful!');
        print(response.body);
      } else {
        // Handle other status codes
        print('Sign-up failed. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle errors
      print('Error occurred: $e');
    }

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        showSpinner = false;
        Navigator.pushNamed(context, Login.id);
      });
    });
  }
}
