
import 'package:flutter/material.dart';
import 'package:flutter_app/component/Avatar.dart';
import 'package:flutter_app/component/MyNote.dart';

class MyNotesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _YState();
  }

  
}

class _YState extends State<MyNotesPage>{


  List<String> _myNotes = new List<String>();




  addNewNoteToList(){
    print("we are adding");

    List<String> tmp = _myNotes;

    tmp.add("hello world ${tmp.length} ");
    

    setState(() {
      _myNotes = tmp;
    });

    print(_myNotes.length);
  }


  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          addNewNoteToList();
                  },),
        body: new Container(
          child: ListView.builder(
            
            itemCount: _myNotes.length,
            itemBuilder: (context, index){
              if ( index % 2 == 0 ) {
                return AvatarWidget();
              } else {
                return Container(
                  height: 150,
                  width: 250,
                  color: Colors.cyanAccent,
                );
              }
            },

          )
        ),
      )
    );
  }
  
}