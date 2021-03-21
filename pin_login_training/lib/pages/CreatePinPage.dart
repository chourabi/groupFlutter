import 'package:flutter/material.dart';
import 'package:pin_login_training/pages/CheckPin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePinPage extends StatefulWidget {
  CreatePinPage({Key key}) : super(key: key);

  @override
  _CreatePinPageState createState() => _CreatePinPageState();
}

class _CreatePinPageState extends State<CreatePinPage> {
  String _pin="_ _ _ _";
  

  var digits = [];
  

  _savePinAndGoToAuth(pin) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('pin', pin);

    // pin is saved
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CheckPinPage()),
        );

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
      _savePinAndGoToAuth(pinToSave);


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
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height - 150 ),
                  
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
