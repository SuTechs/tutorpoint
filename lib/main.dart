import 'package:flutter/material.dart';
import 'package:tutorpoint/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tutor Point',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationHome(),
    );
  }
}
