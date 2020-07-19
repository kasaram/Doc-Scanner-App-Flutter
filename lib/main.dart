

import 'package:flutter/material.dart';
import 'Scanner_home.dart';


void main()  {
  runApp(new MyApp());}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Doc Scanner",
      theme: new ThemeData(
        primaryColor: const Color(0xff106f10),
        accentColor: new Color(0xff25D366),
      ),
      debugShowCheckedModeBanner: false,
      home: new DocScannerHome(),
    );
  }
}
