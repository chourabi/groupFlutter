import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreWidgets extends StatefulWidget {
  MoreWidgets({Key key}) : super(key: key);

  @override
  _MoreWidgetsState createState() => _MoreWidgetsState();
}

void _show(BuildContext ctx) {
  showModalBottomSheet(
      isDismissible: false,
      elevation: 10,
      backgroundColor: Colors.amber,
      context: ctx,
      builder: (ctx) => Container(
            width: 300,
            height: 750,
            color: Colors.white54,
            alignment: Alignment.center,
            child: Text('Breathe in... Breathe out...'),
          ));
}

class _MoreWidgetsState extends State<MoreWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(icon: Icon(Icons.ac_unit), onPressed: (){},)
         ,IconButton(icon: Icon(Icons.ac_unit), onPressed: (){},)
        
        ],),
        body:
            /*Center(child: 
        // alert !!
        /*RaisedButton(
          color: Colors.pink,
          child: Text("ALERT !"),
          onPressed: (){
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return new AlertDialog(
                  title: Text("My title"),
                  content: Container(
                    height: 250,
                    child: Column(children: [
                    Text("This is my message."),
                    TextField()
                  ],),),
                  actions: [
                    FlatButton(child: Text("OK"), onPressed: (){

                      Navigator.pop(context);
                    },)
                  
                  ],
                );
              },
            );
          },
        )*/

        RaisedButton(
          color: Colors.pink,
          child: Text("SNACK BAR !"),
          onPressed: (){
          print("test");
            Scaffold.of(context).showSnackBar(
              SnackBar(
                  content: Text('Some Text'),
                  ),
                 );
            
          })
      ,),*/

            /*  snack bar
        Builder(
      builder: (context) {
        return (Center(
          child: RaisedButton(
              color: Colors.pink,
              child: Text("SNACK BAR !"),
              onPressed: () {
                print("test");
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: (){

                      },

                    ),
                    content: Row(children: [
                      Icon(Icons.linked_camera),
                      Text('CAMERA IS READY')
                    ],),
                  ),
                );
              }),
        ));
      },
    ));*/

            ListView(
      children: [
        Card(
          elevation: 15,
          shadowColor: Colors.black,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(25),
                child: Text('hello world'),

              ),

              RaisedButton(
              color: Colors.pink,
              child: Text("DATE PICK"),
              onPressed: () async {
                var date =  await showDatePicker(
                  context: context, initialDate: new DateTime(2021), firstDate: new DateTime(2010), lastDate: new DateTime(2030));

                  print(date);
              }
        )
            ],
          ),
        )
      ],

      /*RaisedButton(
              color: Colors.pink,
              child: Text("BOTTOM SHEET"),
              onPressed: () {
                _show(context);
              }
        ),*/
      // card widget
    ));
  }
}
