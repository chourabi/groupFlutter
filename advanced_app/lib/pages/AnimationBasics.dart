import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  AnimatedPage({Key key}) : super(key: key);

  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {

  double _initWidth = 150;
  double _initHeight = 150;
  Color _initColor = Colors.pink;
  double _r = 250;





  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    

    return Scaffold(
      body: Container(
        child: Column(children: [
          
          GestureDetector(
            onTap: (){
              setState(() {
                _initHeight = height;
                _initWidth = width;
                _initColor = Colors.amberAccent;
                _r = 0;
              });
            },
            onVerticalDragEnd: (d){
                setState(() {
                _initHeight = 150;
                _initWidth = 150;
                _initColor = Colors.amberAccent;
                _r = 250;
              });
            },
            child: AnimatedContainer(
            
            height: _initHeight,
            width: _initWidth,
            
            duration: Duration(milliseconds: 180),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.all(Radius.circular(_r))
            ),

          ),
          )

        ],),
      ),
    );
  }
}