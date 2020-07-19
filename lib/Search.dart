

import 'package:flutter/material.dart';
import 'dart:ui';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController nameController = TextEditingController();
  TabController _tabController;

  String hint;

  void clearTextInput(){
    nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        movetoLastscreen();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 65.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff106f10),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height*.07,
                  right: 10.0,
                  left: 10.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width*.89,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: ()=>{movetoLastscreen()},
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width*.7,
                          child: TextField(
                            controller: nameController,
                            style: TextStyle(
                              fontSize: 20.0
                            ),
                            decoration: InputDecoration(
                              hintText: "Search..",
                            ),
                            onChanged: (text){
                              hint=text;
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: ()=>{clearTextInput()}
                        )
                      ],
                    ),
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void movetoLastscreen(){
    Navigator.pop(context);
  }
}
