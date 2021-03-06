
import 'package:flutter/material.dart';
import 'package:flutter_app/component/Avatar.dart';
import 'package:flutter_app/component/MyNote.dart';

class MyGalleryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _YState();
  }

  
}

class _YState extends State<MyGalleryPage>{

  bool isGrid = true;
   int count = 20;





  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(

        floatingActionButton: FloatingActionButton(onPressed: (){
          setState(() {
            isGrid = ! isGrid;
          });
        },),

        body: new Container(
          child: GridView.builder(
            itemCount: count,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isGrid == true ? 3 : 1,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
               itemBuilder: (context, index){
            return GestureDetector(
              
              onDoubleTap: () {
                setState(() {
                  count = (count-1);
                });
              },

              child: Container(width: 0, height: 100, color: Colors.grey.shade400,
              child: Image.network("https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png"),
            ),);
          },),
        ),
      )
    );
  }
  
}