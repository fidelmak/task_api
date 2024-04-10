import 'dart:convert';
import 'package:dio/dio.dart';

class AuthService {
  static const String signInUrl = 'https://stacked.com.ng/api/login';

  Future<bool> authenticate(String username, String password) async {
    try {
      // Create Dio instance
      Dio dio = Dio();

      // Make POST request to login endpoint
      Response response = await dio.post(
        signInUrl,
        data: {
          'username': username,
          'password': password,
        },
      );

      // If login is successful, handle the response
      if (response.statusCode == 200) {
        // Handle successful login
        print('Login successful!');
        print(response.data);

        // Return true indicating successful authentication
        return true;
      } else {
        // Handle other status codes
        print('Login failed. Status code: ${response.statusCode}');
        // Return false indicating failed authentication
        return false;
      }
    } catch (e) {
      // Handle Dio errors
      print('Error occurred: $e');
      // Return false indicating failed authentication
      return false;
    }
  }
}
