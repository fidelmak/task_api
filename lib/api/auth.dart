import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static String name = "tunde";

  static const String signInUrl = 'https://stacked.com.ng/api/login';

  Future<bool> authenticate(String username, String password) async {
    try {
      // Construct the request body
      Map<String, dynamic> requestBody = {
        'username': username,
        'password': password,
      };

      final http.Response response = await http.post(
        Uri.parse(signInUrl),
        body: json.encode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // An error occurred during the API call
      print('Error during authentication: $e');
      return false;
    }
  }
}
