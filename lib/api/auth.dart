import 'dart:convert';
import 'package:dio/dio.dart';

class AuthService {
  static const String signInUrl = 'https://stacked.com.ng/api/login';

  Future<bool> authenticate(String username, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({"username": username, "password": password});
    var dio = Dio();
    try {
      var response = await dio.post(
        signInUrl, // Use the correct signInUrl variable
        options: Options(
          headers: headers,
        ),
        data: data, // Pass the data variable
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        return true;
      } else {
        print(response.statusMessage);
        return false;
      }
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }
}
