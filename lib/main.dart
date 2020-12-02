import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tutorpoint/screens/home.dart';
import 'package:tutorpoint/screens/login.dart';
import 'data/utils/modal/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox<bool>('bool');
  await Hive.openBox<String>('string');
  await Hive.openBox<double>('double');
  await Hive.openBox<int>('int');

  User().init();

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
      home: User().userId != null ? NavigationHome() : Login(),
    );
  }
}
