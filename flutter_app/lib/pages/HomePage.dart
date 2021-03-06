import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
 

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    int nbrContainerPerLine = 4;

    return new Scaffold(
      appBar: AppBar(
        title: Text("formation"),
      ),
      body: new SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //color: Colors.red,
              padding: EdgeInsets.all(15),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.greenAccent,
                    height: 250,
                  ),
                  Container(
                    child: Text('My product title'),
                  ),
                  Container(
                    child: Text(
                        'My product title description ,My product title description ,My product title description ,My product title description , '),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 7.5),
                          color: Colors.blue,
                          height: 60,
                          width: 120,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 7.5),
                          color: Colors.blue,
                          height: 60,
                          width: 120,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
