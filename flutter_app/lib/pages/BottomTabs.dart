
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Gallery.dart';
import 'package:flutter_app/pages/Profile.dart';

class BottomTabs extends StatefulWidget {
  BottomTabs({Key key}) : super(key: key);

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {


  int _selectedIndex = 1;

  static  List<Widget> _widgetOptions = <Widget>[
   Container(
     child: Text("hello"),
     color: Colors.orange,
   ),
   Container(
     child: Text("hello"),
     color: Colors.blue,
   ),
   Container(
     child: Text("hello"),
     color: Colors.blue,
   ),
   Container(
     child: Text("hello"),
     color: Colors.blue,
   ),
   Container(
     child: Text("hello"),
     color: Colors.blue,
   ),
   
   
    
  ];

  Color _selectedColor = Colors.blue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedColor,
      appBar: AppBar(),
      bottomNavigationBar: CurvedNavigationBar(
        height: 44,
        animationDuration:  Duration(milliseconds: 100),
        onTap: (int index){
         
            setState(() {
              _selectedColor = index == 1 ? Colors.red: Colors.blue;
            });
          setState(() {
            _selectedIndex = index;
          });
        },
        
        backgroundColor: _selectedColor,
        items: <Widget>[
          Icon(Icons.search, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.list, size: 30),
          
        ],
        
      ),
      drawer: new Drawer(
        elevation: 5,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Container(
                color: Colors.pink,
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications_active),
              onTap: (){},
              title: Text('hello world'),
              trailing: Text("3",style: TextStyle(color: Colors.red,fontSize: 25 ),),
            )
          ],
        ),
      ),
      body: Container(
       child: _widgetOptions.elementAt(_selectedIndex),
    ),
    );
  }
}