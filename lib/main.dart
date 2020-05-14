import 'package:flutter/material.dart';
import 'package:restauranteapp/database/appdatabase.dart';
import 'package:restauranteapp/screens/login.dart';


void main() { 
  runApp(MyApp());
  
  }


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo[900]
      ),
      home: LoginScreen()
    );
    
  }
}