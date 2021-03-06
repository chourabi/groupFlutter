

import 'package:flutter/material.dart';

class MyNote extends StatelessWidget {

  final String title;
  final String description;
  final String date;
  final String lieu;

  const MyNote({Key key, this.title, this.description, this.date, this.lieu}) : super(key: key);
  



  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(25),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              Text(title),
              Text(description),
              Text(date),
              Text(lieu),
              
            ],),
          );
  }


  
}