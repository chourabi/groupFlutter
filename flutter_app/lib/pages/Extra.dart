

import 'package:flutter/material.dart';

class ExtraPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _YState();
  }

  
}

class _YState extends State<ExtraPage>{

TextEditingController _controller = new TextEditingController();
String textValue = "";
String groupValue = 'MALE';

  bool _bgIsDark = false;
  bool _sizeCheck = false;



  double getTextSize(){
    if (_sizeCheck == true) {
      return 15;
    }else if (_sizeCheck == null) {
      return 20;
    }else if (_sizeCheck == false) {
      return 25;
    }
  }







  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(
        


        body: new Container(
          decoration: BoxDecoration(
            
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/bg.png")
            )
          ),
         padding: EdgeInsets.only(top: 25, left:15,right:15),
         child: Column(children: [
           /*TextField(
             //obscureText: true,
             decoration: InputDecoration(
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(30.0))
               ),
               
               hintText: "Please type something...",
               errorText: textValue == '' ? 'feild is required' : null
             ),
             //minLines: 1,
            // maxLines: 6,
             
             controller: _controller,
             onChanged: (String str){
               print(str);
               setState(() {
                 textValue = str;
               });
             },

           ),

           FlatButton(child: Text("hello world"), onPressed: (){
             //String value = _controller.value.text;
            

             _controller.text = "hello world";


           },),
           //RaisedButton(child: Text("hello world"), onPressed: (){}, elevation: 50,)

          Text(textValue)*/


          // radio buttons
          /*Row(children: [
            Radio(
            groupValue: groupValue,
            onChanged: (str){
              print(str);
              setState(() {
                groupValue = str;
              });
            },
            value: 'MALE',
          ),
          Container(child: Text('MALE'),)
          ],),
          Row(children: [
            Radio(
            groupValue: groupValue,
            onChanged: (str){
              print(str);
              setState(() {
                groupValue = str;
              });
            },
            value: 'FEMALE',
          ),
          Container(child: Text('FEMALE'),)
          ],),*/






          Container(
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(children: [
                  // checkbox backgournd
                  Checkbox(value: _bgIsDark, onChanged: (bool val){
                    setState(() {
                      _bgIsDark = val;
                    });
                  },),
                  Container(child: Text(
                    _bgIsDark == true ? 'CHANGE TO WHITE':'CHANGE TO DARK'
                  ),)
                ],),
              ),
              
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(children: [
                  // checkbox backgournd
                  Checkbox(
                    tristate: true,
                    value: _sizeCheck, onChanged: (bool val){
                      print(val);
                    setState(() {
                      _sizeCheck = val;
                    });
                  },),
                  /*Container(child: Text(
                    _bgIsDark == true ? 'CHANGE TO WHITE':'CHANGE TO DARK'
                  ),)*/
                ],),
              ),
              
            ],),
          ),
          Container(
            padding: EdgeInsets.all(15),
            color: _bgIsDark == true ? Colors.black : Colors.white,
            child: Text( 
              'Grand Prix motorcycle racing is the premier class of motorcycle road racing events held on road circuits sanctioned by the Fédération Internationale de Motocyclisme (FIM). Independent motorcycle racing events have been held since the start of the twentieth century[1] and large national events were often given the title Grand Prix.[2] The foundation of the Fédération Internationale de Motocyclisme as the international governing body for motorcycle sport in 1949 provided the opportunity to coordinate rules and regulations in order that selected events could count towards official World Championships. It is the oldest established motorsport world championship.[3]',
              style: TextStyle(
                fontSize: getTextSize(),
                color:  _bgIsDark == true ? Colors.white : Colors.black,),
              ),
          )
          




         ],),
        ),
      )
    );
  }
  
}