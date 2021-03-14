import 'package:advanced_app/pages/AnimationBasics.dart';
import 'package:advanced_app/pages/HomePage.dart';
import 'package:advanced_app/pages/Movie.dart';
import 'package:advanced_app/pages/SliverAppBar.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MoviesPage(),
    );
  }
}

