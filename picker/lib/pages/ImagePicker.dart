import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerPage extends StatefulWidget {
  ImagePickerPage({Key key}) : super(key: key);

  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {

  File _image = null;
  final picker = ImagePicker();

  ImageSource _source = ImageSource.gallery;




  Future _choosePicture() async {

    



    final pickedFile = await picker.getImage(source: _source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Container(height: 80,),
          Container(
            child: GestureDetector(
              onTap: (){
               
                 showModalBottomSheet(
      isDismissible: false,
      elevation: 10,
      backgroundColor: Colors.white,
      context: context,
      builder: (ctx) => Container(
            width: 300,
            height: 250,
            color: Colors.white54,
            alignment: Alignment.center,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Camera'),
                  onTap: (){
                    setState(() {
                      _source = ImageSource.camera;
                    });
                    Navigator.pop(context);
                    _choosePicture();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.wallpaper),
                  title: Text('Gallery'),
                  onTap: (){
                    setState(() {
                      _source = ImageSource.gallery;
                    });
                    Navigator.pop(context);
                    _choosePicture();
                  },
                ),
                
              ],
            ),
          ));

              },
              child: CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              radius: 80,
              backgroundImage: _image == null ? NetworkImage("https://mpng.subpng.com/20180523/tha/kisspng-businessperson-computer-icons-avatar-clip-art-lattice-5b0508dc6a3a10.0013931115270566044351.jpg") : FileImage(_image,),
            ),
            )
          )
        ],),
      ),
    );
  }
}