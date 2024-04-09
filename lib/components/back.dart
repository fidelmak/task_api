import 'package:flutter/material.dart';

class Back extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
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
    );
  }
}
