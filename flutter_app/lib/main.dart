import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Extra.dart';
import 'package:flutter_app/pages/Gallery.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/MyNotes.dart';
import 'package:flutter_app/pages/Profile.dart';
import 'package:flutter_app/pages/Tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyTabsPage(),
    );
  }
}
