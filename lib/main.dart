import 'package:flutter/material.dart';
import 'package:restauranteapp/screens/login.dart';
import 'package:restauranteapp/screens/register.dart';

void main() => runApp(MyApp());

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