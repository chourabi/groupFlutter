import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Gallery.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/MyNotes.dart';
import 'package:flutter_app/pages/Profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyGalleryPage(),
    );
  }
}
