import 'package:flutter/material.dart';
import 'package:social_mobile_app/profile.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> profileImages = [
    "add_icon",
    "profile",
    "profile",
    "profile",
    "profile"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Color(0xfffef7f7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: ListView(
          children: <Widget>[getHeader(), getProfileList(), getImagesList()],
        ),
      ),
    );
  }

  Widget getProfileList() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 120,
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
                        image: AssetImage("assets/profile.png"),
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

  List<List<String>> imageList = [
    [
      "background Image Url",
      "profile image url",
      "1 Hour ago",
      "Robert Downey"
    ],
    [
      "background Image Url",
      "profile image url",
      "3 days ago",
      "Robert Downey"
    ],
    [
      "background Image Url",
      "profile image url",
      "2 hour ago",
      "Robert Downey"
    ],
  ];

  Widget getImagesList() {
    return Column(
      children: imageList.asMap().entries.map((MapEntry map) {
        List<String> list = map.value;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          width: MediaQuery.of(context).size.width,
          height: 370,
          decoration: BoxDecoration(
            color: Color(0xffedbbcd),
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(
              image: AssetImage(
                  "assets/art_face.png"), // list[0] background image url and change to Image.network()
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 370.0 - 100,
                child: Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(width: 25),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xfffae3f2),
                                      blurRadius: 21,
                                      spreadRadius: -12,
                                      offset: Offset(6, 6)),
                                ],
                                borderRadius: BorderRadius.circular(25)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image(
                                image: AssetImage(
                                    "assets/profile.png"), // list[1] background image url and change to Image.network()
                                fit: BoxFit.cover,
                                width: 45,
                                height: 45,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 170,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  list[3],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Color(0xff6a515e),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                list[2],
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xfffd2bbc7)),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.more_vert,
                          size: 30,
                          color: Color(0xff6a515e),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomPaint(painter: BorderPainter(), child: Container()),
            ],
          ),
        );
      }).toList(),
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            child: Column(
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
          ),
          Container(
            padding: EdgeInsets.all(11),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xfffbf3f2), spreadRadius: 5, blurRadius: 26)
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

class BorderPainter extends CustomPainter {
  final radius = 50.0;
  final arcHeight = 50.0;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    final path = Path();
    path.moveTo(size.width, size.height - 150);
    path.arcToPoint(Offset(size.width - 50, size.height - 100),
        radius: Radius.circular(radius));
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, size.height - 150);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
