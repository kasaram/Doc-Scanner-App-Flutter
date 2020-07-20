import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakeImage extends StatefulWidget {
  @override
  _TakeImageState createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {
  File _image;
  final picker = ImagePicker();


  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }
  Future openGallery() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image= File(pickedFile.path);
    });
  }

  TextEditingController nameController =TextEditingController();
  String temp=" ";
  String file="New Doc.pdf";
  createAlertDialog(BuildContext context){
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("Rename"),
        content: TextField(
          controller: nameController,
          style: TextStyle(fontSize: 20.0),
          decoration: InputDecoration(
            hintText: file,
          ),
          onChanged: (text){temp=text;},
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: ()=>{
              file=temp+".pdf",
              Navigator.of(context).pop(nameController.text.toString())
            },
            child: Text("Rename"),
          )
        ],
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60.0),
        child: Stack(
          children: [
            Container (
              decoration: BoxDecoration(
                color: const Color(0xff106f10),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height*.07,
                    right: 5.0,
                    left: 5.0,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back,color: Colors.white,),
                          onPressed: ()=>{movetoLastscreen()},
                        ),

                        MaterialButton(
                          onPressed: ()=>{
                            createAlertDialog(context)
                          },
                          textColor: Colors.white,
                          color: Color(0xff106f10),
                          disabledElevation: 0.0,

                          child: Text(file ,
                            style: TextStyle(fontSize: 20.0),),
                        ),


                        
                            IconButton(
                              icon: Icon(Icons.more_vert),

                              onPressed: ()=>{},
                            )
                        


                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: MediaQuery.of(context).size.height*.003,
            left: MediaQuery.of(context).size.width*.008,
            right: MediaQuery.of(context).size.width*.006,
            child: Container(

                child: Stack(
                  children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.49,
                        height: MediaQuery.of(context).size.height*0.07,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.white,width: 2.0)
                          ),
                          color: Color(0xff106f10),
                          onPressed: ()=>{openGallery()},

                          child: Text("Gallery",style: TextStyle(color: Colors.white,fontSize: 17.0),),
                      ),
                ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.49,
                      height: MediaQuery.of(context).size.height*0.07,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Color(0xff106f10),width: 2.0),

                        ),

                        color: Colors.white,
                        onPressed: ()=>{getImage()},

                        child: Text("Camera",style: TextStyle(color: Color(0xff106f10),fontSize: 17.0),),
                      ),
                    )
                    ]
                )
              ]
                ),
              ),
            ),

        ],
      ),
    );
  }
  void movetoLastscreen() {
    Navigator.pop(context);
  }
}
