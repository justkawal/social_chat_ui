import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_mobile_app/chatting.dart';
import 'package:social_mobile_app/landing.dart';
import 'package:social_mobile_app/messages.dart';
import 'package:social_mobile_app/starting_page.dart';

import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chatting(),
    );
  }
}
