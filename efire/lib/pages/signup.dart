import 'package:efire/pages/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {



  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

TextEditingController _emailControl = new TextEditingController();
TextEditingController _passwordControl = new TextEditingController();

  bool _isLoading = false;
  String _errMessage ="";

  FirebaseAuth auth = FirebaseAuth.instance;


  _createAccount(String email, String password){

    setState(() {
      _isLoading = ! _isLoading;
    });
    auth.createUserWithEmailAndPassword(email: email, password: password).then(( response){
      setState(() {
        _isLoading = ! _isLoading;
      });

      if (response.user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignInPage()),
          );
          
      }
      
    }).catchError((e){


      setState(() {
        _isLoading = ! _isLoading;
        _errMessage = e.message;
      });
      
    });
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  errorText:  null
                ),
                controller: _emailControl,

              ),
            ),
            Container(
              
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: _passwordControl,
                obscureText: true,

              ),
            ),

            _isLoading == false ?

            RaisedButton(
              onPressed: (){
                // create account firebase


                _createAccount(_emailControl.text, _passwordControl.text);



              },
              child: Text('CREATE ACCOUNT'),
            ):

            CircularProgressIndicator(),


            _errMessage == "" ? Container() : 

            Container(
              margin: EdgeInsets.all(15
              ),
              padding: EdgeInsets.all(20),
              color: Colors.red.shade700,
              child: Text(_errMessage, style: TextStyle(color: Colors.white),),
            )
            
          ],
        ),
      ),
      
     
    );
  }
}
