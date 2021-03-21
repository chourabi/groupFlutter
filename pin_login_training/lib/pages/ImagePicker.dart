import 'package:flutter/material.dart';

class ImagePickerPage extends StatefulWidget {
  ImagePickerPage({Key key}) : super(key: key);

  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Container(height: 80,),
          Container(
            child: CircleAvatar(
              backgroundColor: Colors.pink,
              radius: 80,
            ),
          )
        ],),
      ),
    );
  }
}