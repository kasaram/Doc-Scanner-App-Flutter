import 'package:docscanner/New_Document.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Search.dart';
import 'package:flutter/rendering.dart';


class DocScannerHome extends StatefulWidget {
  @override
  _DocScannerHomeState createState() => _DocScannerHomeState();
}

class _DocScannerHomeState extends State<DocScannerHome> with SingleTickerProviderStateMixin {

  TabController _tabController;

  get itemCount => null;


  @override

  void initState(){
    super.initState();
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Doc Scanner"),
          elevation: 0.7,
          actions: <Widget>[

            new IconButton(
                icon: new Icon(Icons.search),
                onPressed: ()=> Navigator.push(context,
                MaterialPageRoute(
                  builder: (context){return SearchScreen();}
                ))
                ),
          ],
        ),
        drawer: Drawer(
          child: Row(
            children: <Widget>[
              new IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: ()=>{},
              )
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff106f10),
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: ()=>{
          Navigator.push(context, MaterialPageRoute(
            builder: (context){return NewDocument();}
          ))
        },
      ),

    );
  }
}
