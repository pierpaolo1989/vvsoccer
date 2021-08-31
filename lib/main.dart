import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soccer/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(),
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Image(image: AssetImage('assets/logo.png')),
        AnimatedAlign(
          alignment: Alignment.center,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: const FlutterLogo(size: 50.0),
        ),
      ]),
    );
  }
}
