import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroView extends StatefulWidget {
  final String imgURL;
  final String productName;
  final String price;
  final String tag;
  HeroView({Key key, this.imgURL, this.productName, this.price, this.tag}) : super(key: key);

  @override
  _HeroViewState createState() => _HeroViewState();
}

class _HeroViewState extends State<HeroView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: widget.tag,
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                
                widget.imgURL
                ,
                fit: BoxFit.cover,
                
                ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(15),
            child: Text(widget.productName,
            style: TextStyle(fontSize: 60),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text("${widget.price} TND",
            style: TextStyle(fontSize: 25),
            ),
          )



        ],
      ),)
    );
  }
}
