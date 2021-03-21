import 'package:flutter/material.dart';
import 'package:pin_login_training/pages/MyHomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckPinPage extends StatefulWidget {
  CheckPinPage({Key key}) : super(key: key);

  @override
  _CheckPinPageState createState() => _CheckPinPageState();
}

class _CheckPinPageState extends State<CheckPinPage> {
  String _pin="_ _ _ _";
  

  var digits = [];
  

  _auth(pinG) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int pin = prefs.getInt('pin');

    if (pinG == pin) {
              Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );

    }else{
      setState(() {
        digits = [];
      });
    }

  }



  _addDigit(int index){
    
    if (digits.length < 4) {
      var newDigits = digits;

    newDigits.add(index);

    setState(() {
      digits = newDigits;
    });

    }else{
      String pinTxt ='';


      for (var i = 0; i < digits.length; i++) {
        pinTxt += '${digits[i]}';

      }


      int pinToSave = int.parse(pinTxt);
      _auth(pinToSave);


    }
    
  }

  String _generatePinText(){

    String txt = '';

    for (var i = 0; i < digits.length; i++) {
      txt += '${digits[i]} ';
    }

    txt+= " _ "* (4-digits.length);

    return txt;


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
         Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
              children: [
                Container(
                  height: 150,
                  child: Center(
                    child: Text(
                      
                      _generatePinText()
                      
                      ,style: TextStyle(fontSize: 60),),
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(icon: Icon(Icons.backspace), onPressed: (){
                    var olddigits = digits;
                    olddigits.removeAt((digits.length-1));
                    setState(() {
                      digits = olddigits;
                    });
                  }),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height - 200 ),
                  
                  child: GridView.builder(
                    
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(

                        onTap: (){
                          _addDigit(index);
                        },


                        child: Container(
                          width: 0,
                          height: 100,
                          color: Colors.orangeAccent,
                          child: Center(
                            child: Text('${index}',style: TextStyle(fontSize: 60),),
                          ),
                         
                              
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          
        ),
      
    );
  }
}
