import 'dart:async';

import 'package:flutter/material.dart';

import 'box_shadow.dart';
import 'lineart_gradient.dart';

class Chatting extends StatefulWidget {
  List<List<String>> chats;
  String name;
  Chatting({Key key, this.name, this.chats}) : super(key: key);

  @override
  _ChattingState createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (mounted) {
        _scrollToBottom();
        timer.cancel();
      }
    });
  }

  _scrollToBottom() {
    if (_scrollController != null && _scrollController.positions.isNotEmpty)
      _scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfffdf4f6),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: 210,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100)),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Typing...",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontSize: 20, color: Color(0xfffd2bbc7)),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Robert",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontSize: 33,
                                color: Color(0xffa06784),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image(
                              image: AssetImage("assets/profile.png"),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: Container(
                              child: widget.chats != null
                                  ? MediaQuery.removePadding(
                                      context: context,
                                      removeTop: true,
                                      removeBottom: true,
                                      child: ListView(
                                        controller: _scrollController,
                                        reverse: true,
                                        children: widget.chats.reversed
                                            .toList()
                                            .asMap()
                                            .entries
                                            .map((MapEntry map) {
                                          List<String> value = map.value;
                                          return Bubble(
                                            message: value[1].toString(),
                                            isMe: value[0] == "own_user_id",
                                          );
                                        }).toList(),
                                      ))
                                  : Center(
                                      child: Container(
                                      child: Text(
                                        "Start chatting ${widget.name != null ? "with " + widget.name : ""}",
                                        maxLines: 3,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Color(0xfffd2bbc7)),
                                      ),
                                    )),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 25),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width - 60,
                                  height: 70,
                                  padding: EdgeInsets.only(right: 9, left: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: getBoxShadowList(),
                                      borderRadius: BorderRadius.circular(70)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                            height: 70,
                                            child: TextFormField(
                                              cursorColor: Color(0xffe3d1da),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  hintStyle: TextStyle(
                                                      color: Color(0xffe3d1da)),
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          top: 16,
                                                          right: 15),
                                                  hintText: "Type a message"),
                                            )),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          print("Send Clicked");
                                        },
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            gradient: getLinearGradient(),
                                            borderRadius:
                                                BorderRadius.circular(70),
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(Icons.send,
                                              color: Colors.white, size: 26),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomPaint(
                      painter: BorderPainter(),
                      size: Size(100, 310),
                      child: Container(
                        width: 100,
                        height: 310,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  final radius = 100.0;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, 100);
    path.arcToPoint(Offset(100, 0), radius: Radius.circular(radius));
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Bubble extends StatelessWidget {
  Bubble({this.message, this.isMe});

  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
        colors: isMe
            ? [Color(0xffe3f3fe), Color(0xffe3f3fe)]
            : [Colors.white, Color(0xfffefcfc)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight);
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = isMe
        ? BorderRadius.only(
            topLeft: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          )
        : BorderRadius.only(
            topRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          );
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: align,
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(left: isMe ? 100 : 15, right: !isMe ? 100 : 15),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                boxShadow: [], borderRadius: radius, gradient: gradient),
            child: Stack(
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(fontSize: 20, color: Color(0xff6a515e)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
