import 'package:advanced_app/api/Api.dart';
import 'package:advanced_app/pages/HeroView.dart';
import 'package:flutter/material.dart';
import 'dart:convert';


class MoviesPage extends StatefulWidget {
  MoviesPage({Key key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {


  Api _api = new Api();
  dynamic _listMovies = null;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    _api.getMoviesList().then((response){
        if (response.statusCode == 200) {
          
           final body = json.decode(response.body);

           setState(() {
             _listMovies = (body['data']['movies']);
           });

        }
        else {
          print(response.reasonPhrase);
        }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listMovies == null ? Center(

        child: CircularProgressIndicator(),
      )
      :
      Container(
        child: ListView.builder(itemCount: _listMovies.length, itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HeroView(
                            imgURL:_listMovies[index]['large_cover_image'],
                            productName: _listMovies[index]['title'],
                            price: _listMovies[index]['summary'],
                            tag: '${_listMovies[index]['id']}')),
                  );
            },
            child: Container(
            width: 150,
            child: Hero(
              tag: '${_listMovies[index]['id']}',
              child: Card(
              child: Column(children: [
              Container(
                width: 100,
                child: 
              Image.network( _listMovies[index]['large_cover_image'] )
              ,),

              Text( _listMovies[index]['title']  )

            ],),),),
          ),
          );
          
        }),
      ),
    );
  }
}