import 'package:flutter/material.dart';
import 'package:pin_login_training/pages/CheckerPage.dart';
import 'package:pin_login_training/pages/Connectivity.dart';
import 'package:pin_login_training/pages/ImagePicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
         visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ImagePickerPage(),
    );
  }
}

