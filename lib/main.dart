// @dart=2.9
import 'package:f_matrimony/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  // SharedPreferences.setMockInitialValues(
  //     {
  //     });
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "MarryMe",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    return SplashScreen();
  }
}
