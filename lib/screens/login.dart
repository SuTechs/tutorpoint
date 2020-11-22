import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 16),
          Image.asset(
            'assets/images/login.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
