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
        children: <Widget>[getHeader(), getProfileList()],
      ),
    );
  }

  List<String> profileImages = [
    "add_icon",
    "profile",
    "profile",
    "profile",
    "profile"
  ];

  Widget getProfileList() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 120,
      //color: Colors.green,

      child: MediaQuery.removePadding(
        context: context,
        child: ListView(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 30),
          scrollDirection: Axis.horizontal,
          children: profileImages.asMap().entries.map((MapEntry map) {
            return Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xfffbf3f2),
                      spreadRadius: -5,
                      blurRadius: 26)
                ],
                gradient: LinearGradient(
                    colors: map.key != 0
                        ? [
                            Color(0xfff49f75),
                            Color(0xff9798ea),
                            Color(0xff70c0fc),
                          ]
                        : [Colors.white, Colors.white],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight),
              ),
              child: map.key != 0
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(65),
                      child: Image(
                        width: 90,
                        height: 90,
                        image: AssetImage("assets/profile.jpg"),
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(
                      Icons.add,
                      color: Color(0xffbca3b0),
                      size: 50,
                    ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget getHeader() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Hello,",
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 25, color: Color(0xfffd2bbc7)),
              ),
              Text(
                "Robert",
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 35,
                    color: Color(0xffa06784),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(11),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xfffbf3f2),
                      spreadRadius: 12,
                      blurRadius: 26)
                ]),
            child: Icon(
              Icons.search,
              color: Color(0xffdabccb),
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
