import 'package:advanced_app/translate/Fr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverAppPage extends StatefulWidget {
  SliverAppPage({Key key}) : super(key: key);

  @override
  _SliverAppPageState createState() => _SliverAppPageState();
}

class _SliverAppPageState extends State<SliverAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(new LngFR().titleHomePage,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Center(
          child: Text("Sample Text"),
        ),
      ),
    );

  }
}