import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TextApi extends StatelessWidget {
  TextApi({Key? key}) : super(key: key);

  Future<void> signIn(String username, String password, String email,
      String phone, String address, String image) async {
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
  }

  void handleSignIn() {
    signIn("paul", "tunde", "tunde", "tunde", "tunde", "tunde");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: handleSignIn,
                child: Text(
                  "signIn",
                  style: TextStyle(color: Colors.white), // Corrected TextStyle
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
