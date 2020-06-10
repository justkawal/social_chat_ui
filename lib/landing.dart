import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Color(0xfffef7f7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: ListView(
        children: <Widget>[
          getHeader(),
        ],
      ),
    );
  }

  Widget getHeader() {
    return Container(
      color: Colors.green,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[],
          ),
          Container(
            child: Icon(Icons.search,color: Colors.black,size: 30,),
          )
        ],
      ),
    );
  }
}
