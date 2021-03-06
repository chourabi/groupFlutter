import 'package:flutter/material.dart';
import 'package:flutter_app/component/Avatar.dart';
import 'package:flutter_app/component/MyNote.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  double m = 25;
  Color _color =  Colors.pink.shade200;


  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      body: new Column(
        children: [
          Container(
            height: 80,
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 25, left: 15),
                  child: Icon(
                    Icons.favorite,
                    color: _color,
                    size: 60,
                  ),
                ),
                Container(
                  child: Text(
                    'hello world',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 150,
            child: Stack(
              overflow: Overflow.visible,
              
              children: [
                GestureDetector(
                  onTap: (){
                    
                    setState(() {
                      _color = Colors.blue;
                    });

                  },
                  child: AvatarWidget(),
                ),
                Positioned(
                  
                  right: 10,
                  top: 10,
                  child: Container(
                    decoration: BoxDecoration( color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(10)) ),
                    height: 30,
                    width: 30,
                   
                  ),
                )
              ],
            ),
          ),
          Container(
            height: m,
          ),
          Container(
            child: Text(
              "RANDOM NAME",
              style: TextStyle(fontSize: 45),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: m),
            child: Text(
              "RANDOM profile user test hello description",
              style: TextStyle(fontSize: 19),
              textAlign: TextAlign.center,
            ),
          ),

          MyNote( 
            title: "hello",
            description: "description",
            date: "2020-20-03",
            lieu: "Tunis",
            
          ),
          MyNote( 
            title: "hello world",
            description: "description",
            date: "2020-20-03",
            lieu: "Tunis",
            
          ),
          
          

          



        ],
      ),
    );
  }
}
