import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class ConnectivityPage extends StatefulWidget {
  ConnectivityPage({Key key}) : super(key: key);

  @override
  _ConnectivityPageState createState() => _ConnectivityPageState();
}

class _ConnectivityPageState extends State<ConnectivityPage> {
  
  bool _visible = false;

  String _status = '';
  Color _statusColor = Colors.white;

  final LocalAuthentication auth = LocalAuthentication();

  var netSTATUS;

  _checkInitConnection() async{
       var result = await (Connectivity().checkConnectivity());
    setState(() {
        _status = (result == ConnectivityResult.none) ? 'NO INTERNET CONNECTION' : 'CONNECTED';
        _statusColor = (result == ConnectivityResult.none) ? Colors.red.shade400 : Colors.green.shade400;
        
      
      });
      

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
_checkInitConnection();
_checkBiometrics();
 

    netSTATUS = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      
      
      setState(() {
        _status = (result == ConnectivityResult.none) ? 'NO INTERNET CONNECTION' : 'CONNECTED';
        _statusColor = (result == ConnectivityResult.none) ? Colors.red.shade400 : Colors.green.shade400;
        _visible = (result == ConnectivityResult.none) ? true : false;
      
      });
      
    });
  }


  _checkBiometrics() async{
    bool canCheckBiometrics = await auth.canCheckBiometrics;

    print(canCheckBiometrics);

    var localAuth = LocalAuthentication();
  

   bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true,
          stickyAuth: true);

    } on PlatformException catch (e) {
      print(e);

      return;
    }
    

  
  
  
  
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 25
        ) ,
        AnimatedOpacity(
  // If the widget is visible, animate to 0.0 (invisible).
  // If the widget is hidden, animate to 1.0 (fully visible).
  opacity: _visible ? 1.0 : 0.0,
  duration: Duration(milliseconds: 500),
  // The green box must be a child of the AnimatedOpacity widget.
  child: Container(
          height: 25,
          color: _statusColor,
          child: Center(child: Text(_status,style: TextStyle(color: Colors.white),),),
        ),
),

      FlatButton(
        child: Text('test'),
        onPressed: (){
          _checkBiometrics();
        },
      )
        
        
      ],),
    );
  }
}