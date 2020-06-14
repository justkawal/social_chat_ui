import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_mobile_app/chatting.dart';
import 'package:social_mobile_app/starting_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Starter(),
    );
  }
}

class Starter extends StatefulWidget {
  Starter({Key key}) : super(key: key);

  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StartingPage(),
    );
  }
}
