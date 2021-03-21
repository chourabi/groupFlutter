import 'package:flutter/material.dart';
import 'package:pin_login_training/pages/CheckPin.dart';
import 'package:pin_login_training/pages/CreatePinPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckPage extends StatefulWidget {
  CheckPage({Key key}) : super(key: key);

  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {

  _checkForPin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int pin = prefs.getInt('pin');

    if (pin != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CheckPinPage()),
        );
    }else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CreatePinPage()),
        );
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkForPin();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}