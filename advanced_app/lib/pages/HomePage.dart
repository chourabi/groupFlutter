import 'package:advanced_app/pages/HeroView.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FINAL APP"),
        ),
        body: Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HeroView(
                              imgURL:
                                  "https://cdn.mos.cms.futurecdn.net/JEKZM22ZasnFC7JFGkAMvU-1200-80.jpg",
                              productName: "super 1",
                              price: '2500',
                              tag: 'hero0',
                            )),
                  );
                },
                child: Hero(
                    tag: 'hero0',
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Image.network(
                          "https://cdn.mos.cms.futurecdn.net/JEKZM22ZasnFC7JFGkAMvU-1200-80.jpg"),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HeroView(
                            imgURL:
                                "https://post.healthline.com/wp-content/uploads/2020/09/Do_Apples_Affect_Diabetes_and_Blood_Sugar_Levels-732x549-thumbnail-1-732x549.jpg",
                            productName: "Apples",
                            price: '3500',
                            tag: 'hero1')),
                  );
                },
                child: Hero(
                    tag: 'hero1',
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        'https://post.healthline.com/wp-content/uploads/2020/09/Do_Apples_Affect_Diabetes_and_Blood_Sugar_Levels-732x549-thumbnail-1-732x549.jpg',
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        },
                      ),
                    )),
              ),
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
