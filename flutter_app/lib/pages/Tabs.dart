import 'package:flutter/material.dart';
import 'package:flutter_app/component/Chat.dart';


class MyTabsPage extends StatefulWidget {
 

  @override
  State<StatefulWidget> createState() {
    return _MyTabsPageState();
  }
}

class _MyTabsPageState extends State<MyTabsPage> {


  List<int> _chats = [12,3,6,8,6,9,6];



  @override
  Widget build(BuildContext context) {



    return DefaultTabController(
      initialIndex: 0,
      length: 3,
    child: Scaffold(
       appBar: AppBar(
          
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_queue),
                text: "tab 1",
              ),
              Tab(
                icon: Icon(Icons.cloud_queue),
              ),
              Tab(
                icon: Icon(Icons.cloud_queue),
              ),
            ],
          ),
    ),
    body: TabBarView(
          children: <Widget>[
            Center(
              child: Container(
                child:
                //new

                ListView.builder(itemCount: _chats.length, itemBuilder: (context,index){
                  return Container(
                      child: Chat(date: '15:60',title: "radom name",subtitle: "last message from last night",)
                    );
                }) 
                

                // old
                /*ListView(
                  children: [


                    // chat widget
                    Container(
                      child: Chat(date: '15:60',title: "radom name",subtitle: "last message from last night",)
                    )



                  ],
                ),*/
              )
            ),
            Center(
              child: Switch(value: true, onChanged: (val){},),
            ),
            Center(
              child: Text('It\'s sunny here'),
            ),
          ],
        ),
    
    
    ),

    

    );
  }
}
