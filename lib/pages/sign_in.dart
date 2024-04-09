import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../api/data.dart';
import '../components/button.dart';
import '../components/text_field.dart';
import '../const/const.dart';
import 'home_page.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});
  static String id = "signUp";
  bool showSpinner = false;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showSpinner = false;

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
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: ListView(
                  children: <Widget>[
                    Flexible(
                        child: Hero(
                            tag: 'logo',
                            child: Container(
                                height: 200.0,
                                child: Image.asset('images/img.png')))),
                    SizedBox(
                      height: 25,
                    ),
                    Center(child: Text("Register as a user")),
                    SizedBox(
                      height: 25,
                    ),
                    MyTextField(
                      hint: "Username",
                      obscure: false,
                      controller: usernameController,
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
                    MyTextField(
                      controller: emailController,
                      hint: "email",
                      obscure: false,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    MyTextField(
                      controller: phoneController,
                      hint: "phone number",
                      obscure: false,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    MyTextField(
                      controller: addressController,
                      hint: "address",
                      obscure: false,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    MyTextField(
                      controller: imageController,
                      hint: "address",
                      obscure: false,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: 20,
                      child: Button(
                        text: Text(
                          "SIGNUP",
                          style: TextStyle(color: textColor),
                        ),
                        myFunc: () {
                          signIn();
                        },
                      ),
                    ),
                  ],
                ))),
        floatingActionButton: SizedBox(
          height: 40,
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

  Future<void> signIn() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String address = addressController.text.trim();

    setState(() {
      showSpinner = true;
    });
    final response = await postData(
      registerUrl,
      username: username,
      password: password,
      email: email,
      phone: phone,
      address: address,
    );

    setState(() {
      showSpinner = false;
    });
  }
}
