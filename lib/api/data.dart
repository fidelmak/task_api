import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

final registerUrl = 'https://stacked.com.ng/api/register';
final profileUrl = 'https://stacked.com.ng/api/profile';

class User {
  final String username;
  final String password;
  final String email;
  final String phone;
  final String address;
  final String image;

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'] ?? '',
        password = json['password'] ?? '',
        email = json['email'] ?? '',
        phone = json['phone'] ?? '',
        address = json['address'] ?? '',
        image = json['image'] ?? '';

  @override
  String toString() {
    return 'User(username: $username, email: $email, phone: $phone, address: $address, image: $image)';
  }
}

Future<User> fetchUser() async {
  final response = await http.get(Uri.parse(profileUrl));
  print("sent");
  print(response.body);

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to fetch profile');
  }
}

Future<http.Response> postData(
  String url, {
  required String username,
  required String password,
  required String email,
  required String phone,
  required String address,
}) async {
  // Construct the body using the provided parameters
  final body = {
    'username': username,
    'password': password,
    'email': email,
    'phone': phone,
    'address': address,
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      body: json.encode(body),
      headers: {'Content-Type': 'application/json'}, // Add headers if needed
    ).timeout(const Duration(seconds: 30));

    return response;
  } on TimeoutException {
    return http.Response(
        "Network Timeout", 408); // Use client error status code for timeout
  } on http.ClientException {
    return http.Response('Client Error', 400); // Use client error status code
  } catch (e) {
    print('Error: $e'); // Print the error message directly
    return http.Response("Error", 500); // Use server error status code
  }
}
