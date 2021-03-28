import 'package:efire/pages/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  FirebaseAuth auth = FirebaseAuth.instance;

  _checkAuth()  {
     Firebase .initializeApp().then((value){
    auth.userChanges().listen((value){
      print(value);
      if (value != null) {
        // connected
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );

      }
    });
    });


  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkAuth();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}