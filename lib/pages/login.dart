import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:task_api/pages/home_page.dart';

import '../api/auth.dart';
import '../api/data.dart';
import '../components/button.dart';
import '../components/text_field.dart';
import '../const/const.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static String id = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showSpinner = false;
  final AuthService _authService = AuthService();

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
                          child: Hero(
                              tag: 'logo',
                              child: Container(
                                  height: 200.0,
                                  child: Image.asset('images/img.png')))),
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
    print(username);
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter username and password.'),
      ));
      return;
    }

    setState(() {
      showSpinner = true;
    });

    bool isAuthenticated = await _authService.authenticate(username, password);

    setState(() {
      showSpinner = false;
    });

    if (isAuthenticated) {
      Navigator.pushNamed(context, HomePage.id);
      print('Authentication successful!');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invalid username or password.'),
      ));
    }
  }
}
