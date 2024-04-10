import 'package:flutter/material.dart';

import '../const/const.dart';

class Button extends StatelessWidget {
  final Widget text;
  final myFunc;

  Button({super.key, required this.text, required this.myFunc});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth / 3;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        elevation: 1.0,
        child: MaterialButton(
          onPressed: myFunc,
          minWidth: buttonWidth,
          height: 50.0,
          child: text,
        ),
      ),
    );
  }
}
