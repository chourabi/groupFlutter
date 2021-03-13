import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNewTabsPage extends StatefulWidget {
  MyNewTabsPage({Key key}) : super(key: key);

  @override
  _MyNewTabsPageState createState() => _MyNewTabsPageState();
}

class _MyNewTabsPageState extends State<MyNewTabsPage> with SingleTickerProviderStateMixin {
 final iconList = <IconData>[
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.brightness_7,
  ];

  AnimationController  _animationController; 
 
 
 @override
  void initState() {
    // TODO: implement initState
    super.initState();

_animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this
    );

  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ScaleTransition(
          scale: Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    )),
          child: FloatingActionButton(
            foregroundColor: Colors.red,
            elevation: 8,
            backgroundColor: Colors.amberAccent,
            child: Icon(
              Icons.brightness_3,
              color: Colors.red,
            ),
            onPressed: () {
              _animationController.reset();
              _animationController.forward();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar (
      icons: iconList,
      activeIndex: 0,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index){}),
      //other params
   
    );
  }
}