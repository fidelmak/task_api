import 'package:flutter/material.dart';

import '../const/const.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.hint,
    required this.obscure,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        height: 50,
        width: 300,
        child: TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            fillColor: Colors.grey[50],
            filled: true,
          ),
        ),
      ),
    );
  }
}
