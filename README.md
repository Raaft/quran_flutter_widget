Getting Started
Example
import 'package:flutter/material.dart';  
import 'package:quran_widget_flutter/src/quran_widget.dart';
  
void main() => runApp(MyApp());  
  
class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      title: 'QuranWidget Demo',  
      theme: ThemeData(  
        primarySwatch: Colors.blue,  
      ),  
      home: QuranWidgetDemo(),  
    );  
  }  
}  
  
class QuranWidgetDemo extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      body: Center(  
        child: QuranWidget(),  
      ),  
    );  
  }  
}  