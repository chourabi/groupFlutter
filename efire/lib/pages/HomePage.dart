import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  User _me = null;


  _getUserInformations(){
    _me = _auth.currentUser;

    print(_me.displayName);
    //_me.updateProfile(displayName: "Taher Chourabi" );
    //_me.updateProfile(photoURL: "https://media-exp1.licdn.com/dms/image/C4D03AQGU1k0Ra6MUDA/profile-displayphoto-shrink_400_400/0/1541146823068?e=1622678400&v=beta&t=jE1l5zCuUCAam6K44Du0Zc_DefAAbFMXm86eBQdZx4w" );
    
  }

  _getMemos() {

    print("getting data");

    CollectionReference memos = FirebaseFirestore.instance.collection('memos');


/* 

  false, wrong , noo , leeeee,

  List<Widget> memosView = new List();

    memos.where('status',isEqualTo: true).get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            memosView.add(Container());
        });
    });*/

    /*memos.add({
      "title":"create second flutter app",
      "description":"clotire first flutter app, and start the second one",
      "status":false
    }).then((value){
      print(value.id);
    });*/


    /*memos.doc('EiToApfbl8OYscQYp4Al').update({
      'date': new DateTime.now()
    }).then((value) => print("updated"));*/

    // realtime changes

    

    /*Stream memosStream = FirebaseFirestore.instance.collection('memos').snapshots();

    memosStream.listen((event) {
      print("new data changes ! ");
    })*/

    

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserInformations();

    _getMemos();

    getFcm();


    sendCustomFCM("et2vobhOCsw:APA91bFrKzkVKVz6NE5wWfbMfl3sru2N3OzVjZCs1EVJWKhOzzXkcsR9AnVlRhuSCmH0ys6cqKgxNdVEHnzHtiyKR3jihnpmbWP6HrPas4oKHReZHZcPOWQT95uLmbzM5VlpaMK4j0L0");


FirebaseMessaging.onMessage.listen((RemoteMessage message) {


  if (message.notification != null) {
    _showNotificationAlert(message.notification);
  }
});



  }


  sendCustomFCM(String token){
    var headers = {
      'Authorization': 'key=AAAAjFOdHoQ:APA91bFk4b20XrrSXdvi9fL5t9IoH6xutnczDGVKou7kPmYQFqli8hJFIrUMS9mVJUSvE1qAULu6dpFsxLUnxX8Canal8XwXRw2tLBmjt16qWNX6pDhKihCImpW_BU4AoxhNDp5h7rmM',
      'Content-Type': 'application/json'
    };

var body = '{\r\n "to" : "'+token+'",\r\n "collapse_key" : "type_a",\r\n "notification" : {\r\n     "body" : "FLUTTER TRAINING",\r\n     "title": "MERCI BC"\r\n },\r\n "data" : {\r\n     "body" : "Body of Your Notification in Data",\r\n     "title": "Title of Your Notification in Title",\r\n     "key_1" : "Value for key_1",\r\n     "key_2" : "Value for key_2"\r\n }\r\n}''';
      http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'), headers: headers , body: body );
  }


Future<void> _showNotificationAlert(RemoteNotification notification) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(notification.title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(notification.body),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  updateUserData(){
    
    
  }


  getFcm(){
     firebaseMessaging.getToken().then((token){
      print('FCM Token: $token');
      firestore.collection('users').doc(_me.uid).set({
        "name":_me.displayName,
        "token":token,
        "id":_me.uid
      }).then((value){

      });
    });
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                CircleAvatar(
                  child: Image.network( _me != null ? _me.photoURL : ''),
                ),
                _me != null ? 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(_me.displayName),
                    
                    Text(_me.email),
                    
                  ],
                ):

                Text('chargement...')
              ],),
            )
          ],
        ),
      ),
      body: Container(
        child: StreamBuilder(

          stream: firestore.collection('memos').snapshots(),
          builder: (context, snapshot){
            if (snapshot.hasError) {
              return(Text('Oups'));
            }else if(snapshot.hasData){
                  return ListView.builder(itemCount: snapshot.data.docs.length, itemBuilder: (context, index){
                      return(
                        Card(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(snapshot.data.docs[index]['title'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: snapshot.data.docs[index]['status'] == true ? Colors.green : Colors.orange  ),),
                            Text(snapshot.data.docs[index]['description'],style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)
                            ,
                            snapshot.data.docs[index]['status'] == true ?
                            Text("Done")
                            :
                            FlatButton(
                              onPressed: (){
                                // update firebase documenbt

                                firestore.collection('memos').doc(snapshot.data.docs[index].id).update({"status":true}).then((value){
                                    // what shuold we do ?

                                });

                              },
                              child: Text("CLOTURE"),
                            )
                          ],),
                          ),
                        )
                      );
                    });
                    
            }else{
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(child: CircularProgressIndicator(),),
              );
            }
          },
          
        ),
      ),
    );
  }
}