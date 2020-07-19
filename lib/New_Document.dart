
import 'package:docscanner/Take_Image.dart';
import 'package:flutter/material.dart';


class NewDocument extends StatefulWidget {
  @override
  _NewDocumentState createState() => _NewDocumentState();
}

class _NewDocumentState extends State<NewDocument> {

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
      backgroundColor: Colors.white,
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

                              RaisedButton(
                                onPressed: ()=>{
                                  createAlertDialog(context)
                                },
                                textColor: Colors.white,
                                color: Color(0xff106f10),

                                child: Text(file ,
                                style: TextStyle(fontSize: 20.0),),
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert),
                                    onPressed: ()=>{},
                                  )
                              ),


                            ],
                          ),
                        ),
                      ],
                  ),
                ),
              ],
            ),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff106f10),
        child: Icon(Icons.camera_alt,color: Colors.white,),
        onPressed: ()=>{
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {return TakeImage();}
          ))
        }
      ),
    );
  }
  void movetoLastscreen() {
    Navigator.pop(context);
  }
}
